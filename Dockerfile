FROM ubuntu:20.04
RUN apt update
RUN apt install ssh wget npm -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:350522147|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
