### 도구 설치

1. kubectl 1.27 설치 [https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

```
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
kubectl version --short --client
```
2. eksctl 0.142.0 설치 [https://github.com/weaveworks/eksctl/blob/main/README.md#installation](https://github.com/weaveworks/eksctl/blob/main/README.md#installation)

```
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

3. AWS CLI Version 1 삭제

```bash
sudo rm /usr/bin/aws
sudo rm /usr/bin/aws_completer
sudo rm -rf /usr/local/aws-cli
```

4. AWS CLI Version 2 설치

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

5. homebrew 설치 (k9s, helm 설치 위함)

```bash
sudo passwd ec2-user
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/ec2-user/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

6. k9s 설치

```bash
brew install derailed/k9s/k9s
```

7. helm 설치

```bash
brew install helm
```

### Cloud9 Instance Profile 변경

1. `Cloud9InstanceProfile` IAM Role 생성 - Administrator Policy 추가
2. Cloud9 Modify IAM role to `Cloud9InstanceProfile`
3. Cloud9 - AWS managed temporary credential 옵션 비활성화
4. `aws sts get-caller-identity`로 `Cloud9InstanceProfile`로 변경 확인

### Cloud9 Security Group 변경

1. 8080 Port를 Inbound Public으로 개방