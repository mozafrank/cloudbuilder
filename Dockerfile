FROM debian:sid

RUN apt update && \
    apt install -y git npm python3-pip curl wget rsync unzip jq && \
    apt clean

RUN pip3 install git+https://github.com/mozilla-it/cloudsecrets

RUN curl -sSL https://sdk.cloud.google.com | bash && \
    rsync -a /root/google-cloud-sdk/ /usr/local/ && \
    rm -rf /root/google-cloud-sdk

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
