FROM gentoo/portage:latest as portage

FROM gentoo/stage3-amd64:latest

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

COPY .local/etc /

WORKDIR /usr/src/quickstart
COPY . /usr/src/quickstart

RUN /bin/sh .local/share/quickstart/bin/provision.sh
