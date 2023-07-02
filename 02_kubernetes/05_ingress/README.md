### Ingress를 통해 ALB 생성 - Subnet ID 반드시 수정할 것!

```bash
# Console에서 Public Subnet들의 ID를 확보해서 ingress.yaml 파일을 수정
aws ec2 describe-subnets \
    --filters "Name=tag:kubernetes.io/role/elb,Values=1" "Name=tag:alpha.eksctl.io/cluster-name,Values=${CLUSTER_NAME}" \
    --query "Subnets[*].SubnetId" \
    --output text

kubectl apply -f ingress.yaml
```
