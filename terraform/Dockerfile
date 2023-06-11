# Pull base image.
FROM ubuntu:latest

RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y
################################
# Install Terraform
################################
# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip

#Download AWSCLIV2
RUN wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O awscliv2.zip

RUN unzip awscliv2.zip
RUN ./aws/install
# Unzip
RUN unzip terraform_1.4.6_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/

################################
# Install python
################################

RUN apt-get install -y python3-pip
#RUN ln -s /usr/bin/python3 python
RUN pip3 install --upgrade pip
RUN python3 -V
RUN pip --version

################################
# Install AWS CLI
################################
RUN pip install awscli --upgrade --user

# add aws cli location to path
ENV PATH=~/.local/bin:$PATH

# Adds local templates directory and contents in /usr/local/terrafrom-templates
#ADD templates /usr/local/bin/templates
#RUN mkdir ~/.aws
COPY ./backend.tf /
COPY ./main.tf /

COPY ./deploy.sh /

ARG aws_access_key_id
ARG aws_secret_access_key

RUN aws configure set aws_default_region sa-east-1


ENTRYPOINT ["./deploy.sh"]

