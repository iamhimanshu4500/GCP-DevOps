# Deploy, Scale, and Update Website on Google Kubernetes Engine (GKE)

This project demonstrates how to deploy a containerized web application on Google Kubernetes Engine (GKE), scale it using a Horizontal Pod Autoscaler (HPA), and perform a rolling update without downtime.  
This project is based on the Google Cloud SkillBoost Lab: **"Deploy, Scale, and Update Your Website on GKE"**.

---

## 🎯 Objectives
- Create a GKE cluster using `gcloud`
- Deploy an application using Kubernetes manifests
- Expose the application using a LoadBalancer service
- Implement autoscaling using HPA
- Perform a rolling update on the application
- Validate cluster behavior using GKE dashboard & kubectl

---

## 🏗️ Architecture
- **GKE Cluster**
- **Deployment**
- **Service (LoadBalancer)**
- **Horizontal Pod Autoscaler**
- **Container Registry (Artifact Registry)**
- **Cloud Shell / gcloud**

---

## 🚀 Steps Performed

### 1️⃣ Create GKE Cluster
```bash
gcloud container clusters create gke-lab-cluster \
  --zone us-central1-a \
  --num-nodes 3
```

### 2️⃣ Build & Push Docker Image
```
gcloud builds submit --tag gcr.io/<PROJECT-ID>/gke-app:v1 .
```

3️⃣ Deploy Application

```
kubectl apply -f manifests/deployment.yaml
kubectl apply -f manifests/service.yaml
```

4️⃣ Expose LoadBalancer Service

```
kubectl get svc
```


5️⃣ Enable Autoscaling (HPA)

```
kubectl apply -f manifests/hpa.yaml
```


6️⃣ Perform a Rolling Update

```
kubectl set image deployment/gke-app \
  gke-app=gcr.io/<PROJECT-ID>/gke-app:v2
```
