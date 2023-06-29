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
  
WORKDIR /root

CMD ["aws", "s3", "ls"]
