#!/usr/bin/bash

# Install the desired platform. See example for MicroK8s.
sudo snap install microk8s --classic
sudo apt install docker.io -y

# Set the desired platform. See example for MicroK8s.
kube='sudo microk8s kubectl'

# Applying ALL manifests.
echo ""
echo "DEPLOYING"
echo ""
$kube apply -f namespace.yaml
$kube apply -f secret.yaml
$kube apply -f deployment.yaml
$kube apply -f service.yaml
$kube apply -f ingress.yaml

# Checking ALL resources.
echo ""
echo "CHECKING"
echo ""
$kube get ns
$kube get secret -n demo-namespace
$kube describe secret demo-secret -n demo-namespace
$kube get pods -n demo-namespace
$kube get pods -n demo-namespace -o wide
$kube get replicaset -n demo-namespace
$kube get svc -n demo-namespace
$kube describe svc demo-service -n demo-namespace
$kube get ing -n demo-namespace
$kube describe ing demo-ingress -n demo-namespace

# Checking ALL resources.
echo ""
echo "END"
echo ""
