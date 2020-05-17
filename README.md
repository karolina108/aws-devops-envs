# aws-devops-envs
Environments for mastering AWS DevOps Engineer skills

## Conventions

### Stack names

Stack names have the following format:
    `${Project}-${Stage}-${Component}` - in Pascal Case

Stack names will be used as a part of resource name given by CloudFormation.

### Case

- Resources in CloudFormation: Pascal case (PascalCase)
- Exports: Pascal case and hyphens (`-`)
- File names: Kebab case (kebab-case)
- Avoid All Caps (Vpc instead of VPC etc.)
- Avoid numbers (One instead of 1)
- Shortcuts:

    - sg: security group

### Resource tagging

All resources should inherit or have added the following tags:

- Project
- Stage
- Component (optional)

    - Network
    - Security
    - Data
    - App (Application)

- Function (optional)

    - Core: All resources related to the core project business functions
    - Security: resources used for securing the environment
    - Compliance: resources used for compliance, auditing etc. (CloudTrail & Config belong here)
    - Operations: monitoring, logging, alerts, notifications, env. management
    - DevOps: code repositories, CI/CD (testing, builds, deployments), patching updates etc.
    - Finance: budgets, cost control

- BusinessUnit (optional)

EC2 instances must have the `Name` tag, as well tags for:

- `DeploymentGroup`: for grouping instances in deployment groups (used later by CodeDeploy)
- `PatchingGroup`: patching groups (used later by SSM)
