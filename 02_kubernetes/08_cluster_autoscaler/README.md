# Cluster Autoscaler
https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/autoscaling.html#cluster-autoscaler

## IAM Poilcy 생성 - Line 14, <cluster-name> 반드시 수정할 것!
aws iam create-policy \
    --policy-name AmazonEKSClusterAutoscalerPolicy \
    --policy-document file://cluster-autoscaler-policy.json
    
## IRSA 생성 - cluster와 account number를 환경에 맞게 수정
eksctl create iamserviceaccount \
  --cluster=${CLUSTER_NAME} \
  --region=ap-northeast-2 \
  --namespace=kube-system \
  --name=cluster-autoscaler \
  --attach-policy-arn=arn:aws:iam::${AWS_ACCOUNT_ID}:policy/AmazonEKSClusterAutoscalerPolicy \
  --override-existing-serviceaccounts \
  --approve

## Line 165, cluster 이름 변경후, manifest 설치
kubectl apply -f cluster-autoscaler-autodiscover.yaml

## 테스트 후 Cluster Autoscaler 삭제
kubectl delete -f cluster-autoscaler-autodiscover.yaml