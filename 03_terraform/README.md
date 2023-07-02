# Getting started with Terraform

## Terraform commands
```bash
# provider와 state, module 등을 로컬 환경에 구성하는 커맨드
terraform init

# 실제 state 파일을 건드리지 않고, terraform 실행 결과를 시뮬레이션 해주는 커맨드 (가장 많이 사용)
terraform plan

# 실제로 리소스를 생성 및 변경하고 state 파일을 업데이트하는 커맨드
terraform apply

# 실제로 리소스를 삭제하고 state 파일을 업데이트하는 커맨드
terraform destroy

# Terraform으로 만들지 않은 리소스의 정보를 Terraform state 파일에 등록하는 커맨드
terraform import

# 현재 state 파일에 등록된 리소스들을 보여주는 커맨드
terraform state ls

# state 파일에서 특정 리소스의 정보를 삭제하는 커맨드
terraform state rm

# 로컬 환경의 state 파일로 리모트 환경으로 업로드하는 커맨드
terraform state push

# 리모트 환경의 state 파일을 다운로드 받는 커맨드
terraform state pull
```

### Exercise 1. AWS Console에서 DynamoDB를 만들고, terraform import로 state 파일에 등록해보자.

### Exercise 2. DynamoDB를 module로 분리해보자.

### Exercise 3. 로컬의 state 파일을 리모트로 옮겨서 관리해보자.
