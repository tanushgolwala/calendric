FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    openssh-server \
    calcurse \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd /uploads && chmod 777 /uploads

RUN echo 'root:changethisbeforebuildhehe' | chpasswd

RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

VOLUME /root/.calcurse

CMD ["/usr/sbin/sshd", "-D"]
