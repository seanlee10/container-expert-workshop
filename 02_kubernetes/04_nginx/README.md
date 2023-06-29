### 테스트 워크로드 배포

1. nginx service와 deployment 생성

```bash
git clone https://github.com/seanlee10/service-mesh-hands-on.git
kubectl apply -f nginx.yaml
```

1. ingress 생성

```bash
kubectl apply -f ingress.yaml
```
