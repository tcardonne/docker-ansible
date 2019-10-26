FROM willhallonline/ansible:2.7-alpine

WORKDIR /ansible

RUN apk --no-cache add \
    tar \
    && rm -rf /var/cache/apk/*

VOLUME ["/ssh"]

COPY ansible.cfg /etc/ansible/ansible.cfg

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
