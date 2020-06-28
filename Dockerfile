FROM ubuntu:20.04

EXPOSE 8555
EXPOSE 8444

ENV TZ=Europe/Minsk

COPY docker-entrypoint.sh /usr/local/bin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get install python3.8-venv python3.8-distutils sudo git lsb-core -y \
    && git clone https://github.com/Chia-Network/chia-blockchain.git \
    && cd chia-blockchain \
    && git checkout tags/1.0beta7 -b 1.0beta7 \
    && sed -i 's/127.0.0.1/chia/g' src/daemon/client.py \
    && sed -i 's/localhost/chia/g' src/daemon/server.py \
    && sed -i 's/127.0.0.1/chia/g' src/rpc/abstract_rpc_server.py \
    && sed -i 's/localhost/chia/g' src/rpc/abstract_rpc_server.py \
    && sed -i 's/127.0.0.1/chia/g' src/wallet/websocket_server.py \
    && sed -i 's/host=None/host="chia"/g' src/server/server.py \
    && sed -i 's/127.0.0.1/chia/g' src/util/initial-config.yaml \
    && sed -i 's/localhost/chia/g' src/rpc/full_node_rpc_client.py \
    && sed -i 's/localhost/chia/g' src/rpc/harvester_rpc_client.py \
    && sed -i 's/localhost/chia/g' src/rpc/farmer_rpc_client.py \
    && sed -i 's/127.0.0.1/chia/g' src/server/server.py \
    && sh install.sh \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]