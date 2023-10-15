#!/usr/bin/env bash

# Get Nodes details
echo "Node details: "
kubectl get nodes

# Loadbalancer
echo "Loadbalancer: "
kubectl get service/loadbalancer-service

# Other details
echo "Deploy, RS, SVC, Pod details: "
kubectl get deploy,rs,svc,pods