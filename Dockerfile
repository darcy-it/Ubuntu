# ecs:       https://gallery.ecr.aws/
# dockerhub: https://hub.docker.com/
# linux2: https://aws.amazon.com/jp/amazon-linux-2/release-notes/
#
FROM public.ecr.aws/amazonlinux/amazonlinux:2.0.20211223.0

# yum update & install
RUN yum update -y
RUN yum install \
        systemd \
        tar \
        unzip \
        sudo \
        -y

# install aws cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install

# install for develop, etc.
#RUN sudo amazon-linux-extras install golang1.11 -y

# init
CMD ["/sbin/init"]

