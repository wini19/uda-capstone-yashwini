#!/usr/bin/env bash

cluster_name=capstone
aws_region=us-east-1

if /.eksctl utils describe-stacks --region=${aws_region} | grep -q ${cluster_name}; then
    echo "Cluster already exists"
else
    echo "Creating new cluster..."
    /.eksctl create cluster --name ${cluster_name} --region=${aws_region} --nodegroup-name cap-nodes --nodes 2
    echo "Cluster created"
    aws eks update-kubeconfig --region us-east-1 --name capstone
    echo "Node Details: "
    /.kubectl get nodes
fi