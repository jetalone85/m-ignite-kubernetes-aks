FROM alpine

ENV M_WORKDIR "/workdir"
ENV M_RESOURCES "/resources"
ENV M_SHARED "/shared"

WORKDIR /workdir
ENTRYPOINT ["make"]

RUN apk --no-cache add curl

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN apk add --update --no-cache make=4.3-r0 &&\
    wget https://github.com/mikefarah/yq/releases/download/3.3.4/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

ARG ARG_M_VERSION="unknown"
ENV M_VERSION=$ARG_M_VERSION

COPY resources /resources
COPY workdir /workdir

ARG ARG_HOST_UID=1000
ARG ARG_HOST_GID=1000
RUN chown -R $ARG_HOST_UID:$ARG_HOST_GID \
    /workdir \
    /resources

USER $ARG_HOST_UID:$ARG_HOST_GID
