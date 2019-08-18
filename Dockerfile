FROM willhallonline/ansible:2.8-alpine

WORKDIR /ansible

VOLUME ["/ssh"]

COPY ansible.cfg /etc/ansible/ansible.cfg

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]