output "cluster_ip" {
    value = "${join(",", aws_instance.example.*.private_ip)}"
}
