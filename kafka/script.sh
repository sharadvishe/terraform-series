#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

yum clean metadata
yum install -y epel-release
yum install git python python-devel python-pip openssl ansible -y
