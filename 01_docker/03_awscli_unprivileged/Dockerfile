FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

# AWSCLI install
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip
  
# Unprivileged user setup
RUN groupadd --gid 1000 ec2-user \
  && useradd --uid 1000 --gid 1000 \
    --shell /bin/bash --create-home ec2-user

USER ec2-user
WORKDIR /home/ec2-user

CMD ["aws", "s3", "ls"]
