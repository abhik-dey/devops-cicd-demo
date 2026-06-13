# 🚀 DevOps CI/CD Pipeline — GitHub Actions

![CI/CD Pipeline](https://img.shields.io/github/actions/workflow/status/abhik-dey/devops-cicd-demo/ci-cd.yml?branch=main&label=CI%2FCD%20Pipeline&style=for-the-badge)
![Node.js](https://img.shields.io/badge/Node.js-18%2B-339933?style=for-the-badge&logo=node.js&logoColor=white)
![Jest](https://img.shields.io/badge/Jest-Testing-C21325?style=for-the-badge&logo=jest&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

> A production-style **3-stage CI/CD pipeline** built with GitHub Actions that automatically tests, builds, and deploys a Node.js application on every push to `main`. Part of my **DevOps Portfolio** series.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Pipeline Architecture](#-pipeline-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Running Tests](#-running-tests)
- [How the Pipeline Works](#-how-the-pipeline-works)
- [Resume Highlights](#-resume-highlights)
- [DevOps Portfolio Roadmap](#-devops-portfolio-roadmap)

---

## 🌟 Overview

This project demonstrates a real-world CI/CD workflow where:

- Every **push** or **pull request** to `main` triggers the pipeline automatically
- Code must **pass all tests** before it can be built
- The build must **succeed** before deployment is triggered
- A broken commit **never reaches production** — the pipeline blocks it

---

## 🏗 Pipeline Architecture
Push to main

│

▼

┌─────────────┐

│  JOB 1      │  ← Runs on every push & PR

│  TEST       │  npm ci → jest --coverage → upload artifact

└──────┬──────┘

│ only if tests pass ✅

▼

┌─────────────┐

│  JOB 2      │

│  BUILD      │  node app.js → curl health check → validate

└──────┬──────┘

│ only if build passes ✅ + only on push to main

▼

┌─────────────┐

│  JOB 3      │

│  DEPLOY     │  deployment summary → production release

└─────────────┘

**Key design decisions:**
- `needs: test` and `needs: build` enforce strict job ordering
- `if: github.ref == 'refs/heads/main'` prevents PRs from triggering deployments
- `npm ci` used instead of `npm install` for deterministic, clean installs in CI
- Coverage reports uploaded as downloadable artifacts on every run

---

## 📁 Project Structure
devops-cicd-demo/

├── .github/

│   └── workflows/

│       └── ci-cd.yml       # GitHub Actions pipeline definition

├── src/

│   ├── app.js              # HTTP server (Node.js)

│   ├── math.js             # Core business logic

│   └── math.test.js        # Jest unit tests

├── package.json

├── .gitignore

└── README.md

---

## 🚀 Getting Started

### Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| Node.js | 18+ | [nodejs.org](https://nodejs.org) |
| Git | Any | [git-scm.com](https://git-scm.com) |

### Local Setup

```bash
# Clone the repository
git clone https://github.com/abhik-dey/devops-cicd-demo.git
cd devops-cicd-demo

# Install dependencies
npm install

# Start the app
npm start
# → Server running on http://localhost:3000
```

Visit `http://localhost:3000` — you'll see:

```json
{
  "status": "ok",
  "examples": {
    "add(2,3)": 5,
    "subtract(10,4)": 6,
    "multiply(3,3)": 9
  }
}
```

---

## 🧪 Running Tests

```bash
npm test
```

Expected output:
PASS  src/math.test.js

Math functions

✓ add: 2 + 3 should equal 5

✓ subtract: 10 - 4 should equal 6

✓ multiply: 3 × 3 should equal 9

✓ add: handles negative numbers
Test Suites: 1 passed, 1 total

Tests:       4 passed, 4 total

Coverage:    100%

---

## ⚙️ How the Pipeline Works

### Trigger Events

| Event | Test | Build | Deploy |
|-------|------|-------|--------|
| Push to `main` | ✅ | ✅ | ✅ |
| Pull Request to `main` | ✅ | ✅ | ❌ |
| Push to other branch | ❌ | ❌ | ❌ |

### Proving the Pipeline Works

```bash
# 1. Break the code intentionally
# In src/math.js: change  return a + b  →  return a - b
git add src/math.js
git commit -m "bug: intentionally break add function"
git push
# → Test job fails ❌ — Build and Deploy are BLOCKED

# 2. Fix the code
# Change back:  return a - b  →  return a + b
git add src/math.js
git commit -m "fix: restore correct add function"
git push
# → All 3 jobs go green ✅
```

---

## 📄 Resume Highlights

> **Designed and implemented a 3-stage CI/CD pipeline using GitHub Actions**, automating test execution (Jest, 100% pass rate), build validation, and deployment gating on every commit to `main`; reduced manual deployment steps to zero and enforced quality gates that block broken code from reaching production.

**Skills demonstrated:**
- `GitHub Actions` — workflow authoring, job dependencies, event triggers
- `CI/CD pipelines` — test → build → deploy sequential gating
- `YAML` — pipeline configuration syntax
- `Jest` — JavaScript unit testing with coverage reports
- `Node.js` — HTTP server and modular application design

---

## 🗺 DevOps Portfolio Roadmap

| # | Project | Status |
|---|---------|--------|
| **1** | **CI/CD Pipeline with GitHub Actions** | ✅ Complete |
| 2 | Dockerize a Web App | 🔜 Next |
| 3 | Linux Server Monitoring — Prometheus + Grafana | ⏳ Pending |
| 4 | Deploy an App on Kubernetes | ⏳ Pending |
| 5 | Infrastructure as Code with Terraform on AWS | ⏳ Pending |
| 6 | Centralized Logging with ELK Stack | ⏳ Pending |
| 7 | Configuration Management with Ansible | ⏳ Pending |
| 8 | GitOps Workflow with ArgoCD | ⏳ Pending |
| 9 | Secure CI/CD with DevSecOps (Trivy, Snyk) | ⏳ Pending |
| 10 | Auto-scaling Cloud Architecture on AWS | ⏳ Pending |
| 11 | AWS Cost Optimization Dashboard | ⏳ Pending |
| 12 | Self-healing Infrastructure with Kubernetes | ⏳ Pending |

---

## 📜 License

MIT © [Abhik Dey](https://github.com/abhik-dey)

---

<p align="center">Built as part of a hands-on DevOps learning journey 🛠️</p>
