#!/bin/bash
sudo yum update -y && \
sudo yum install httpd -y && \
sudo service httpd start && \
sudo chkconfig httpd on && \
sudo touch /var/www/html/index.html && \
sudo chmod 777 /var/www/html/index.html && \
echo "<h1>I Love Terraform </h1>" > /var/www/html/index.html && \
sudo yum install docker -y && \
sudo service docker start && \
sudo usermod -aG docker ec2-user && \
sudo chkconfig docker on && \
sudo yum install git -y
sudo yum update - y && \
sudo yum install java-1.8.0 -y && \
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
sudo yum install jenkins -y && \
sudo service jenkins start && \
sudo touch /etc/yum.repos.d/kubernetes.repo && \
sudo chmod 777 /etc/yum.repos.d/kubernetes.repo && \
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF
sudo setenforce 0 
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
sudo swapoff -a
sudo yum install -y kubeadm kubelet kubectl --disableexcludes=kubernetes
sudo systemctl enable --now kubelet
sudo touch /etc/sysctl.d/k8s.conf
sudo chmod 777 /etc/sysctl.d/k8s.conf
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo modprobe br_netfilter
sudo sysctl --system

