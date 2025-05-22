## Overview

This project automates the deployment of the **Chronokeys application**, a typing speed game that tests the user's typing accuracy and words per minute. The deployment is orchestrated on **Azure** using **Terraform** for infrastructure provisioning and **GitHub Actions** for a robust **CI/CD pipeline**. It provisions **Azure Container Apps** to host the containerised application, integrates with **Azure Container Registry (ACR)** for **Docker** image management, and leverages **Azure Front Door** for efficient and secure global traffic routing, including **HTTPS**. This setup ensures scalability, security, and efficiency for the application

## End-to-End Architecture Diagram
<img src="https://raw.githubusercontent.com/hanadisa/chronokeys-aca/2c5f578ff5dfecfdbf0812a1083e90d36adeb924/docs/Images/architecture-diagram.png" width="1000">

---

## 🎥Live Demonstration

<div style="text-align: center; margin: 20px 0;">
  <h3>Prod:</h3>
  <div style="width: 200px; margin: 0 auto; border-radius: 10px;overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/chronokeys-live.gif?raw=true" alt="Prod GIF" width="60%" />
  </div>
</div>

--- 

## Running Chronokeys Locally

If you want to run Chronokeys on your local machine for development or testing, follow these simple steps:

1.  Navigate to the `app` directory:
    ```bash
    cd app
    ```
2.  Open `index.html` in your web browser: Chronokeys is a client-side application, so you can directly open the `index.html` file in your preferred web browser (Chrome, Firefox, Safari, etc.) to run it locally.

## Key Components

| Component                   | Description                                                                 |
| :-------------------------- | :-------------------------------------------------------------------------- |
| Azure Container Registry (ACR) | Stores Docker images for deployment and provides a secure registry.         |
| Azure Container Apps        | Hosts the containerised web application, offering serverless scaling.       |
| Azure Front Door            | Provides a scalable and secure entry point for web traffic, including global routing, caching, and SSL termination. |
| Terraform                   | Automates infrastructure provisioning and management as Infrastructure as Code (IaC). |
| GitHub Actions CI/CD        | Orchestrates continuous integration (CI) and continuous deployment (CD) of the application and infrastructure. |
| Trivy                       | Performs vulnerability scanning of Docker images within the CI pipeline.    |
| TFLint                      | Lints Terraform configurations for syntax and best practices.               |
| Checkov                     | Scans Terraform code for security and compliance issues.                    |

## Project Structure

```
chronokeys-aca/
│
├── .github/                     
│   └── workflows/               # GitHub Actions CI/CD pipeline YAMLs
│       ├── acr-push.yml         # Builds Docker image, runs Trivy scan, and pushes to ACR
│       ├── infra-apply.yml      # Applies Terraform infrastructure changes
│       ├── infra-destroy.yml    # Manually triggered workflow to destroy Terraform infrastructure
│       └── tf-plan.yml          # Runs Terraform plan, TFLint, and Checkov on Pull Requests
├── app/                        
│   ├── css/                     
│   │   ├── loader.css
│   │   └── style.css
│   ├── images/                  
│   ├── js/                      
│   │   ├── loader.js
│   │   └── script.js
│   └── index.html               
├── docs/                       
├── terraform/                   
│   ├── modules/                 
│   │   ├── acr/                
│   │   ├── container_app/      
│   │   ├── frontdoor/           
│   │   ├── identity/            
│   │   └── network/             
│   ├── backend.tf              
│   ├── locals.tf               
│   ├── main.tf                 
│   ├── outputs.tf               
│   └── providers.tf             
├── .dockerignore                
├── .gitignore                   
├── Dockerfile                   
```
## Technologies Used

* ✅ **Azure**: Container Apps, ACR, Front Door
* ✅ **Terraform**: Infrastructure as Code (IaC) automation
* ✅ **Docker**: Containerisation of the application
* ✅ **GitHub Actions**: Continuous Integration & Deployment (CI/CD)
* ✅ **Trivy**: Container image vulnerability scanning
* ✅ **TFLint**: Terraform code linting
* ✅ **Checkov**: IaC security and compliance scanning

## Deployment to Azure

This project automates the deployment of Chronokeys to Azure through the following stages:

1.  **Dockerisation:** The Chronokeys application is containerised using the `Dockerfile` (located in the project root based on your structure). This ensures a consistent environment for deployment.
2.  **Building and Pushing the Docker Image:** Upon code changes to the `app/` directory or `Dockerfile` on the `prod` branch, the `acr-push.yml` GitHub Actions workflow automatically builds the Docker image, performs a **Trivy vulnerability scan**, and then pushes the image to the Azure Container Registry (ACR).
3.  **Infrastructure Validation (on Pull Request):** When infrastructure changes are proposed in a Pull Request to the `prod` branch, the `tf-plan.yml` workflow automatically runs. This executes `terraform plan` to preview changes, `tflint` for code quality, and `checkov` for security analysis, providing crucial feedback before merging.
4.  **Infrastructure Provisioning with Terraform (on Merge):** After infrastructure changes are reviewed and merged into the `prod` branch, the `infra-apply.yml` GitHub Actions workflow triggers. It provisions and manages the necessary Azure infrastructure, including the ACR and Azure Container Apps, using the Terraform configurations in the `terraform/` directory.
5.  **Deployment to Azure Container Apps:** The Azure Container App service is configured to pull the latest Docker image of Chronokeys from the ACR, making the application live and accessible.
6.  **Global Traffic Routing with Azure Front Door:** Azure Front Door is provisioned via Terraform to handle global web traffic, provide caching, and manage HTTPS/SSL for your application, including support for custom domains.

## 📸 Chronokeys: Live on Azure with Custom Domain

✅ **Azure Container Apps Overview**

<img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/aca-overview.png?raw=true" width="900">
<img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/az-aca-live.png?raw=true" width="600">

✅ **Azure Front Door Route & DNS Configuration**

<img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/az-dns-config2.png?raw=true" width="900">
<img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/azfrontdoor-live.png?raw=true" width="600">
<img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/domain.png?raw=true" width="400">
<img src="https://github.com/hanadisa/chronokeys-aca/blob/prod/docs/Images/dns-prod.png?raw=true" width="400">


## 📜 License

Licensed under MIT License.
