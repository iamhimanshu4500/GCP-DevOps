#!/bin/bash

# --- Simple gcloud script for GKE Lab ---

PROJECT_ID="your-project-id"
CLUSTER_NAME="gke-lab-cluster"
ZONE="us-central1-a"
IMAGE="gcr.io/$PROJECT_ID/gke-app:v1"

echo "Setting project..."
gcloud config set project $PROJECT_ID

echo "Creating GKE cluster..."
gcloud container clusters create $CLUSTER_NAME \
  --zone $ZONE \
  --num-nodes 2

echo "Getting cluster credentials..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE

echo "Building Docker image..."
gcloud builds submit --tag $IMAGE ../app

echo "Image built and pushed: $IMAGE"
