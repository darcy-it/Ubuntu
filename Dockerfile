# ecs:       https://gallery.ecr.aws/
# dockerhub: https://hub.docker.com/
# linux2: https://aws.amazon.com/jp/amazon-linux-2/release-notes/
#
FROM public.ecr.aws/amazonlinux/amazonlinux:2.0.20211223.0

# yum update & install
RUN amazon-linux-extras install -y
RUN yum install \
        systemd \
        bash \
        tar \
        zip \
        unzip \
        sudo \
        vim \
        wget \
        nmap \
        telnet \
        jq \
        procps-ng \
        net-tools \
        #openssh-server \
        #openssh-client \
        -y
RUN yum update -y

# install aws cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install

# prompt
ENV BASH_RC bashrc
ENV BASH_PROFILE bash_profile
RUN echo "export PS1=\"[\u@\h \W]\]# \"" >> ~/.${BASH_RC}
RUN echo 'alias ll="ls -l --color"' >> ~/.${BASH_RC}
RUN echo "export PS1=\"[\u@\h \W]\]# \"" >> ~/.${BASH_PROFILE}
RUN echo 'alias ll="ls -l --color"' >> ~/.${BASH_PROFILE}

# install for develop, etc.
#RUN sudo amazon-linux-extras install golang1.11 -y

# init
#CMD ["bash", "run.sh"]
#CMD ["/sbin/init"]
#CMD ["/usr/sbin/tomcat","DFORGRAUND"]]

#COPY run.sh /run.sh

