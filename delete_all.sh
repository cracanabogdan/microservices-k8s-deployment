#!/bin/bash
echo "Cleaning up resources..."
kubectl delete -f k8s/frontend/
kubectl delete -f k8s/backend/
kubectl delete -f k8s/redis/
kubectl get all -A