# Istio Service Mesh
https://istio.io/latest/docs/setup/getting-started/

## Install Istio

```bash
# install istioctl cli
cd ~/environment
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.18.0
export PATH=$PWD/bin:$PATH
istioctl install --set profile=default -y

# enable istio on default namespace
kubectl label namespace default istio-injection=enabled
```

## Install Color Service

```bash
# istio workshop 경로로 이동
cd ~/environment/container-expert-workshop/02_kubernetes/11_istio

kubectl apply -f 01_color-service.yaml
```

## Install Gateway

```bash
kubectl apply -f 02_gateway.yaml
```

## Install Ingress - Subnet ID 반드시 수정할 것!

```bash
# get public subnet ids
aws ec2 describe-subnets \
    --filters "Name=tag:kubernetes.io/role/elb,Values=1" "Name=tag:alpha.eksctl.io/cluster-name,Values=${CLUSTER_NAME}" \
    --query "Subnets[*].SubnetId" \
    --output text


kubectl apply -f 03_ingress.yaml
```

## Install VirtualServices

```bash
kubectl apply -f 04_virtualservice.yaml
```

## Install Prometheus

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/addons/prometheus.yaml
```


## Install Kiali

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/addons/kiali.yaml
```

## Install DestinationRules

```bash
kubectl apply -f 05_destinationrule.yaml
```


## Install VirtualServices - 주석 부분 교체 후 다시 적용

```bash
kubectl apply -f 04_virtualservice.yaml
```
