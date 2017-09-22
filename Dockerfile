ARG IMAGE

FROM ${IMAGE}

RUN apk update && apk add --update ca-certificates curl && update-ca-certificates 

ARG VERSION
ARG DIST

WORKDIR /opt/portainer
RUN chown 1000:1000 .

USER 1000:1000

RUN set -x \
	&& mkdir -p /opt/portainer/data \
	&& curl -fL https://github.com/portainer/portainer/releases/download/${VERSION}/${DIST}.tar.gz | tar -xz -C /opt

ENTRYPOINT ["/opt/portainer/portainer", "--data", "/opt/portainer/data", "--no-analytics"]