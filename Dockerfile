FROM ubuntu:20.04

EXPOSE 8555
EXPOSE 8444

ENV TZ=Europe/Minsk

COPY docker-entrypoint.sh /usr/local/bin
COPY healthcheck.sh /usr/local/bin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install python3.8-venv python3.8-distutils sudo git lsb-core -y && \
    git clone https://github.com/Chia-Network/chia-blockchain.git && \
    cd chia-blockchain \
    && git checkout tags/1.0beta22 -b 1.0beta22 && \
    sh install.sh && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]