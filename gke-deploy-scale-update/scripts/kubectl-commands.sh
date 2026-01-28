#!/bin/bash

# --- Simple kubectl script for GKE Lab ---

echo "Applying deployment..."
kubectl apply -f ../manifests/deployment.yaml

echo "Applying service..."
kubectl apply -f ../manifests/service.yaml

echo "Checking resources..."
kubectl get pods
kubectl get svc

echo "Applying HPA..."
kubectl apply -f ../manifests/hpa.yaml

echo "HPA Status:"
kubectl get hpa

echo "Rolling update example:"
# Replace v2 with your update tag
kubectl set image deployment/gke-app gke-app=gcr.io/your-project-id/gke-app:v2

echo "Done!"
