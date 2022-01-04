resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE
  key_name      = aws_key_pair.mykey.key_name

  count = var.CLUSTER_SIZE
  tags = var.TAGS
  provisioner "file" {
    source      = "./ansible"
    destination = "/tmp/ansible"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}



resource "null_resource" "provision_kafka_cluster" {
  count = var.CLUSTER_SIZE

  connection {
    host = "${element(aws_instance.example.*.private_ip, count.index)}"
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  provisioner "remote-exec" {
    inline = [
      # Adds all cluster members' IP addresses to /tmp/servers.txt (on each member)
      "echo '${join("\n", formatlist("%v", aws_instance.example.*.private_ip))}' | awk '{ print $0 }' | sudo tee -a /tmp/servers.txt > /dev/null",
      "cd /tmp/ansible && ansible-playbook playbook.yml --tags install,start"
    ]
  }
}
