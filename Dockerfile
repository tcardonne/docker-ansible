FROM willhallonline/ansible:2.7-alpine

WORKDIR /ansible

VOLUME ["/ssh"]

RUN apk add --update \
    unzip \
  && rm -rf /var/cache/apk/*

COPY ansible.cfg /etc/ansible/ansible.cfg

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
