# Istio Service Mesh
https://istio.io/latest/docs/setup/getting-started/

## Install Istio

```bash
# install istioctl cli
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.18.0
export PATH=$PWD/bin:$PATH
istioctl install --set profile=default -y

# enable istio on default namespace
kubectl label namespace default istio-injection=enabled
```

## Install Color Service

```bash
kubectl apply -f 01_color-service.yaml
```

## Install Gateway

```bash
kubectl apply -f 02_gateway.yaml
```

## Install Ingress

```bash
kubectl apply -f 03_ingress.yaml
```

## Install VirtualServices

```bash
kubectl apply -f 04_virtualservice.yaml
```

## Install DestinationRules

```bash
kubectl apply -f 05_destinationrule.yaml
```

## Install Prometheus

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/addons/prometheus.yaml
```


## Install Kiali

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/addons/kiali.yaml
```

