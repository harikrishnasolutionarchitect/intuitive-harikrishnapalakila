FROM ubuntu:22.04

### Install the following dependenices in the docker image
# 
# curl iproute2 sshfs unzip less groff 
# Install kubectl from https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
#
# Install AWS CLI from https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
# 
# Install the above tools, unpack and make it available in the PATH executable
###

RUN apt-get update && apt-get install curl -y \
     iproute2 \
     sshfs \
     unzip \
     groff
RUN curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin && export PATH=$PATH:/usr/local/bin && echo $PATH
RUN curl -LO https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && unzip awscli-exe-linux-x86_64.zip && export PATH=$PATH:/usr/local/bin/aws && echo $PATH 


ENTRYPOINT ["/bin/sleep", "15"]
CMD ["20"]
