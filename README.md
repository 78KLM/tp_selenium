# Cloud-Native Microservices Orchestration with Kubernetes & CI/CD

## 🚀 Overview

This project demonstrates a complete Cloud-Native deployment and orchestration of a microservices-based web application. Using a retail "Boutique" application, I implemented a full CI/CD pipeline and deployed the infrastructure on a Kubernetes cluster, focusing on scalability, security, and high availability.

## 🏗️ Architecture & Technologies

- **Application:** Java Spring Boot Web Application
- **Containerization:** Docker (multi-stage builds)
- **Orchestration:** Kubernetes (deployed on Minikube)
- **CI/CD:** GitHub Actions
- **Container Registry:** GitHub Container Registry (GHCR.io)

## 🛠️ Key Features

### 1. Continuous Integration & Deployment (CI/CD)
- Fully automated pipeline defined in `.github/workflows/ci.yml`.
- Automatic build and push of Docker images to GHCR on every `git push`.
- Deployment stage configured to apply Kubernetes manifests to the cluster.

### 2. High Availability & Scalability
- **Horizontal Pod Autoscaling (HPA):** Configured to automatically scale from 2 to 8 replicas based on CPU utilization.
- **Rolling Updates:** Implemented zero-downtime deployment strategy for seamless application updates.

### 3. Resilience & Health Checks
- **Liveness Probes:** Kubernetes automatically restarts the container if the application crashes.
- **Readiness Probes:** Traffic is only routed to the container once the application has fully started and is ready to serve requests.

### 4. Secure & Modular Configuration
- Separated configuration from code using Kubernetes **ConfigMaps**.
- Managed sensitive data (credentials, keys) using Kubernetes **Secrets**.

## 💻 How to Run Locally

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/78klm/k8s-microservices-orchestration.git](https://github.com/78klm/k8s-microservices-orchestration.git)
    cd k8s-microservices-orchestration
    ```

2.  **Start Minikube:**
    ```bash
    minikube start --driver=docker
    ```

3.  **Apply manifests:**
    ```bash
    kubectl apply -f k8s/
    ```

4.  **Access the application:**
    ```bash
    minikube service boutique-svc --url
    ```

---
*Developed by **Kalemba Exocé** - Aspiring DevOps & Cloud Engineer*