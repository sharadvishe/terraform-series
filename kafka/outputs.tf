output "cluster_ip" {
    value = "${join(",", aws_instance.broker.*.private_ip)}"
}
