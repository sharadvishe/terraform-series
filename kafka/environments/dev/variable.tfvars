AWS_REGION = "eu-west-1"

AMIS = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0000bebe516f304b1"
  }

INSTANCE_TYPE = "t2.micro"
CLUSTER_SIZE = 3
PATH_TO_PRIVATE_KEY = "mykey"
PATH_TO_PUBLIC_KEY = "mykey.pub"
INSTANCE_USERNAME = "centos"

TAGS = {
    terraform ="yes",
    zookeeper = "yes",
    kafka = "yes",
    environment = "dev"
  }
