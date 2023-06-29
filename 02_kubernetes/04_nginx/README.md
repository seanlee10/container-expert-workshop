### 테스트 워크로드 배포

```bash
# nginx service와 deployment 생성
kubectl apply -f nginx.yaml

# port-forward로 Cloud9 인스턴스 8080 포트 접속하여 확인
kubectl port-forward svc/nginx 8080:80 --address='0.0.0.0'
```

