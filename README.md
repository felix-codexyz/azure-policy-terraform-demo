# azure-policy-terraform-demoAzure Policy as Code with Terraform Cloud
This repository demonstrates implementing Azure Policy as Code to enforce region restrictions and a Terraform deployment that fails due to policy enforcement, managed via Terraform Cloud and GitHub Actions.
Prerequisites

Azure Subscription (Owner/Contributor permissions)
Azure CLI (Install)
Terraform CLI (Install)
Git (Install)
GitHub Account
Terraform Cloud Account (Sign up)
Text Editor (e.g., VS Code)
Terminal (PowerShell, Bash, or Command Prompt)

Setup Instructions
1. Terraform Cloud Setup

Sign up/log in to Terraform Cloud.
Create an organization (e.g., my-enterprise-org).
Create two CLI-driven workspaces: azure-policy-workspace and azure-storage-workspace.
Generate an API token in User Settings > Tokens and store it securely.

2. Azure Service Principal

Log in to Azure CLI: az login


Get Subscription ID:az account show --query id --output tsv


Create Service Principal:az ad sp create-for-rbac --name "TerraformCloudSP" --role Contributor --scopes /subscriptions/<subscription-id> --sdk-auth


In Terraform Cloud, for both workspaces, add environment variables:
ARM_CLIENT_ID
ARM_CLIENT_SECRET (sensitive)
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID



3. GitHub Repository

Clone this repository:git clone https://github.com/felix-codexyz/azure-policy-terraform-demo.git
cd azure-policy-terraform-demo


Directory structure:azure-policy-terraform-demo/
├── .github/workflows/
│   ├── policy-assignment.yml
│   └── terraform-workflow.yml
├── policy/
│   ├── restrict-region-policy.json
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── terraform/
│   ├── modules/storage-account/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md



4. Configure Terraform Cloud Variables

For azure-policy-workspace:
Terraform Variables:
tf_organization: my-enterprise-org
tf_policy_workspace: azure-policy-workspace




For azure-storage-workspace:
Terraform Variables:
tf_organization: my-enterprise-org
tf_storage_workspace: azure-storage-workspace
resource_group_name: demo-resource-group
storage_account_name: demostorage<unique-suffix> (unique, 3-24 lowercase letters/numbers)
location: australiaeast





5. Configure GitHub Actions

In GitHub, go to Settings > Secrets and variables > Actions > Secrets:
Add TF_API_TOKEN: Terraform Cloud API token.
Add AZURE_CREDENTIALS: JSON output from Service Principal.


In Settings > Secrets and variables > Actions > Variables:
Add:
TF_ORGANIZATION: my-enterprise-org
TF_POLICY_WORKSPACE: azure-policy-workspace
TF_STORAGE_WORKSPACE: azure-storage-workspace
RESOURCE_GROUP_NAME: demo-resource-group
STORAGE_ACCOUNT_NAME: demostorage<unique-suffix>
LOCATION: australiaeast


6. Deploy

Push code to main:git add .
git commit -m "Initial setup"
git push origin main


Create and push a feature branch:git checkout -b feature/storage-deployment
git push origin feature/storage-deployment


Create a pull request from feature/storage-deployment to main.
Monitor workflows in Actions tab:
policy-assignment.yml: Runs on push to main, applies policy.
terraform-workflow.yml: Runs plan on feature/* push, apply on PR merge.



Expected Outcome

Policy assignment succeeds, restricting resources to 'East US'.
Terraform apply fails due to policy, as it attempts to deploy in 'Australia East'.

Troubleshooting

Authentication Errors: Verify AZURE_CREDENTIALS and TF_API_TOKEN.
Policy Not Enforced: Check Azure Portal (Policy > Assignments).
Terraform Errors: Check GitHub Actions logs or Terraform Cloud run details.
Storage Account Name Conflict: Ensure storage_account_name is unique.

Cleanup
To avoid costs:
cd policy
terraform destroy
cd ../terraform
terraform destroy

Enterprise Best Practices

Modular Terraform code for reusability.
Terraform Cloud for secure state management.
GitHub Actions for automated CI/CD.
No hardcoded credentials or values.
Separation of policy and resource deployment.
Comprehensive documentation in README.
