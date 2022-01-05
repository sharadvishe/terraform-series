AWS_REGION = "eu-west-1"

AMIS = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0000bebe516f304b1"
  }

vpc_security_group_ids = [ "sg-05aed1f69f7115db6" ]
subnet_id = "subnet-08f0dce0f185e86d2"
INSTANCE_TYPE = "t2.micro"
CLUSTER_SIZE = 3
KEY_NAME = "terraform"
PATH_TO_PRIVATE_KEY = "terraform.pem"
PATH_TO_PUBLIC_KEY = "mykey.pub"
INSTANCE_USERNAME = "centos"
ENV = "dev"

TAGS = {
    terraform ="yes",
    zookeeper = "yes",
    kafka = "yes",
    environment = "dev"
  }
