FROM alpine:3.9
WORKDIR /

RUN apk update && \
   apk add py3-pip curl && \
   curl -o /bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.20.4/bin/linux/amd64/kubectl && \
   chmod u+x /bin/kubectl

COPY . /tmp/kubediff/
RUN pip3 install /tmp/kubediff/
RUN pip3 install -r /tmp/kubediff/requirements.txt

COPY entrypoint.sh kubediff compare-images /

ENTRYPOINT ["/entrypoint.sh"]

ARG revision
LABEL maintainer="Weaveworks <help@weave.works>" \
      org.opencontainers.image.title="kubediff" \
      org.opencontainers.image.source="https://github.com/weaveworks/kubediff" \
      org.opencontainers.image.revision="${revision}" \
      org.opencontainers.image.vendor="Weaveworks"
