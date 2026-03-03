# Microservices Demo – Kubernetes Deployment

A complete Kubernetes deployment of the **Online Boutique** microservices application, based on [Google's microservices demo](https://github.com/GoogleCloudPlatform/microservices-demo.git).  
This project showcases service discovery, internal networking, resilience, and container orchestration in a local cluster.

---

## 🏗 Architecture & Core Concepts

### 🔹 Service Discovery (Internal DNS)
- Each microservice communicates using Kubernetes DNS names instead of static IPs.
- Example: the `frontend` service reaches Redis through `redis-cart:6379`.
- This enables automatic routing, load balancing, and easier scaling.

### 🌐 Networking & Exposure Strategy
- `frontend` is exposed via **NodePort (30007)** to allow browser access.
- All other services use **ClusterIP**, keeping internal communication isolated and secure.
- This separation reduces the attack surface and follows best practices for microservice networking.

### 🔁 Self‑Healing & Runtime Stability
- Configured **livenessProbes** (TCP checks) to detect unresponsive containers.
- Kubernetes automatically restarts failing containers after a short grace period.
- Redis uses an **emptyDir** volume for fast, ephemeral caching that survives container restarts but not pod rescheduling.

### ⚙️ Performance & Configuration Optimizations
- `DISABLE_PROFILER="1"` disables cloud‑specific telemetry to reduce overhead in local environments.
- YAML manifests are structured modularly for clarity and easy extension.

---
## 🚀 Quick Start (Linux/Minikube)

1. **Make scripts executable:**
```bash
   chmod +x apply_all.sh delete_all.sh
```
2. **Deploy everything:**
```bash
   ./apply_all.sh
```
3. **Access the app (minikube)**
```bash
   minikube service frontend
```
4. **Clean up:**
```bash
   ./delete_all.sh
```