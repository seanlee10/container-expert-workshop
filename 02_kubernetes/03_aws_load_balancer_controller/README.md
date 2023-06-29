### AWS Load Balancer Controller 설치

1. IAM Identity Provider 생성 - Cluster Name 반드시 수정할 것!

```bash
# IAM Identity Provider 생성
eksctl utils associate-iam-oidc-provider \
    --region ap-northeast-2 \
    --cluster $CLUSTER_NAME \
    --approve
```

2. IAM Policy 생성 

```bash
# IAM Policy 생성
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json
```

3. IAM Role과 EKS Service Account 생성 - Cluster Name 반드시 수정할 것!

```bash
# IAM Role과 EKS Service Account 생성
eksctl create iamserviceaccount \
    --cluster=${CLUSTER_NAME} \
    --region=ap-northeast-2 \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=arn:aws:iam::${AWS_ACCOUNT_ID}:policy/AWSLoadBalancerControllerIAMPolicy \
    --approve
```

4. `aws-load-balancer-controller` helm chart 설치

```bash
# helm repo 추가
helm repo add eks https://aws.github.io/eks-charts

# aws-load-balancer-controller helm chart 설치
helm install aws-load-balancer-controller \
    eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=${CLUSTER_NAME} \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller
```