### EKS Cluster 생성

```bash
CLUSTER_NAME=<cluster-name>
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
eksctl create cluster --name $CLUSTER_NAME --region ap-northeast-2 --version 1.27 --node-private-networking
```
