# Mini DevOps Dashboard

## 1. Project Description

Mini DevOps Dashboard is a simple web application built using HTML, CSS, and JavaScript.

The project demonstrates containerization, CI/CD automation, Docker image publishing, and cloud infrastructure management.

### Features

- Digital clock displaying the current time.
- Interactive click counter.
- Light and dark theme switcher.
- Frontend health-check button.
- Responsive user interface.

## 2. Technologies Used

- HTML5, CSS3, JavaScript
- Docker and Nginx
- Git and GitHub
- GitHub Actions
- Docker Hub
- AWS EC2
- Terraform

## 3. Project Structure

```text
Final-project/
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── deploy.yml
└── students/
    └── Pyatkov_Volodymyr/
        ├── .github/workflows/
        │   ├── ci.yml
        │   └── deploy.yml
        ├── infra/
        │   ├── main.tf
        │   ├── variables.tf
        │   ├── outputs.tf
        │   └── .terraform.lock.hcl
        ├── src/
        │   ├── index.html
        │   ├── style.css
        │   └── script.js
        ├── Dockerfile
        ├── .dockerignore
        ├── .gitignore
        └── README.md
```

The root `.github/workflows/` directory contains the GitHub Actions workflows executed by GitHub.

## 4. Local Setup and Installation

### Prerequisites

- Git
- Docker

### Step 1. Clone the repository

```bash
git clone https://github.com/EndermanElectro121/Final-project.git
cd Final-project/students/Pyatkov_Volodymyr
```

### Step 2. Build the Docker image

```bash
docker build -t mini-devops-dashboard .
```

### Step 3. Run the container

```bash
docker run -d -p 8080:80 --name mini-dashboard mini-devops-dashboard
```

### Step 4. Open the application

Open:

```text
http://localhost:8080
```

### Step 5. Stop the container

```bash
docker stop mini-dashboard
docker rm mini-dashboard
```

## 5. GitHub Actions Secrets

The following repository secrets are required for automated deployment:

| Secret | Description |
|---|---|
| `DOCKERHUB_USERNAME` | Docker Hub username |
| `DOCKERHUB_TOKEN` | Docker Hub access token |
| `EC2_HOST` | Public IP address of the EC2 instance |
| `EC2_USER` | SSH username |
| `EC2_SSH_KEY_B64` | Base64-encoded private SSH key |

Add secrets under:

**GitHub → Settings → Secrets and variables → Actions.**

Never commit passwords, tokens, private SSH keys, or other sensitive information.

## 6. CI/CD Pipeline

GitHub Actions automates application testing and deployment.

### Continuous Integration (CI)

The CI workflow runs when code is pushed to `main` or a pull request targets `main`.

It performs the following steps:

1. Checks out the repository.
2. Verifies application files.
3. Builds the Docker image.
4. Runs the application in a test container.
5. Checks the HTML, CSS, and JavaScript files using HTTP requests.

### Continuous Deployment (CD)

The CD workflow starts automatically after a successful CI run on `main`.

It performs the following steps:

1. Checks out the tested commit.
2. Authenticates with Docker Hub.
3. Builds the Docker image.
4. Pushes `latest` and commit-specific image tags to Docker Hub.
5. Connects to AWS EC2 through SSH.
6. Pulls the new Docker image.
7. Replaces the previous application container.
8. Starts the updated container.

The application is available at:

```text
http://13.51.200.227
```

## 7. Infrastructure Management with Terraform

Terraform is used to automate the creation and configuration of AWS infrastructure resources.

The current Terraform configuration:

- Retrieves information about an existing EC2 instance.
- Creates an AWS Security Group.
- Configures inbound SSH (port 22) and HTTP (port 80) rules.
- Attaches the Security Group to the existing EC2 network interface.
- Provides outputs containing the EC2 instance information and Security Group ID.

The EC2 instance itself is created separately and is not managed by Terraform.

### Terraform Commands

Run these commands inside the `infra` directory:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To inspect managed resources:

```bash
terraform state list
```

Terraform state and variable files containing infrastructure details must not be committed to the repository.

## 8. Project Goal

The goal of this project is to demonstrate practical DevOps skills, including Docker containerization, automated CI/CD pipelines, cloud deployment, and Infrastructure as Code using Terraform.
