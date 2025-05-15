# 🚀 Public EKS Cluster with Managed Node Group via Terraform + GitHub Actions

This project provisions:
- A **VPC** with **public subnets**
- An **Internet Gateway** and **Route Table**
- A **Public EKS Cluster**
- A **Managed Node Group (EC2 Worker Nodes)**  
All automated via **Terraform** and **GitHub Actions**.

---

## 📂 Project Structure

├── .github/
│ └── workflows/
│ └── eks-deploy.yml
├── terraform/
│ ├── backend.tf
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
├── .gitignore
└── README.md


---

## 📦 Prerequisites

- AWS account
- AWS IAM user with permissions for:
  - `eks:*`
  - `ec2:*`
  - `iam:*`
  - `s3:*`
  - `dynamodb:*` (if using remote state)
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [GitHub CLI](https://cli.github.com/) (for managing secrets)

---

## 🔐 GitHub Secrets Required

| Secret Name               | Description                         |
|:-------------------------|:------------------------------------|
| `AWS_ACCESS_KEY_ID`        | Your AWS Access Key                 |
| `AWS_SECRET_ACCESS_KEY`    | Your AWS Secret Access Key          |
| `AWS_REGION`               | AWS Region (e.g., `ap-south-1`)     |

Add them using GitHub CLI:
```bash
gh secret set AWS_ACCESS_KEY_ID --body "YOUR_ACCESS_KEY"
gh secret set AWS_SECRET_ACCESS_KEY --body "YOUR_SECRET_KEY"
gh secret set AWS_REGION --body "ap-south-1"

📜 Terraform Variables
Defined in terraform/variables.tf

Variable	Description	Default
aws_region	AWS region	-
cluster_name	EKS cluster name	-
vpc_cidr	VPC CIDR block	10.0.0.0/16
public_subnet_cidrs	List of public subnet CIDRs	["10.0.1.0/24", "10.0.2.0/24"]
node_instance_type	EC2 instance type for nodes	t3.medium
desired_capacity	Desired node count	2
max_capacity	Maximum node count	3
min_capacity	Minimum node count	1

⚙️ GitHub Actions Workflow
Located at .github/workflows/eks-deploy.yml

It performs:

Code checkout

AWS credentials configuration

Terraform init, plan, and apply

Trigger via Actions tab → Run workflow

🚀 Deploy Instructions
1️⃣ Clone this repo

git clone https://github.com/yourname/eks-terraform-github-actions.git
cd eks-terraform-github-actions


2️⃣ Set up GitHub secrets (if not done)

3️⃣ Push your changes and trigger the GitHub Action workflow from the Actions tab.

🧹 Destroy Resources (optional)
If you want to clean up, create a .github/workflows/eks-destroy.yml workflow with:

bash
Copy
Edit


terraform destroy -auto-approve \
  -var "aws_region=${{ secrets.AWS_REGION }}" \
  -var "cluster_name=my-github-eks-cluster"

And run it manually via GitHub Actions.

📊 Outputs
After successful deployment:

VPC ID

Public Subnet IDs

EKS Cluster Endpoint

EKS Node Group Name

Will be shown in the Terraform output section.

📌 Notes
Ensure your EKS IAM role has the required policies

Subnets created are public (with public IP on launch enabled)

Nodes are managed via EKS Node Groups

You can scale node count via Terraform variables

📸 Example
EKS Cluster endpoint output:

Apply complete!
Outputs:

eks_cluster_endpoint = "https://XXXXXXXX.gr7.ap-south-1.eks.amazonaws.com"

🙌 Author
Your Name — yourgithub

📃 License
MIT

yaml
Copy
Edit


---

✅ Would you like me to generate a `eks-deploy.yml` workflow file next for this exact setup too? ⚙️✨

