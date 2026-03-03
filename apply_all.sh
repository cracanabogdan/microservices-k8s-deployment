#!/bin/bash
echo "Deploying Redis..."
kubectl apply -f k8s/redis/

echo "Deploying Backend..."
kubectl apply -f k8s/backend/

echo "Deploying Frontend..."
kubectl apply -f k8s/frontend/

echo "Status:"
kubectl get pods