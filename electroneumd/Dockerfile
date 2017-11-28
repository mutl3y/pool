FROM ubuntu:17.10

WORKDIR /opt/electroneum-pool

EXPOSE 80

ENV NAME electroneum-pool

# Update package
RUN  apt-get -qq update \
  && apt-get install -y wget curl iputils-ping netcat git apt-utils unzip \
  && rm -rf /var/lib/apt/lists/*

# Contains the blockchain
VOLUME /root/.electroneum

# Generate your wallet via accessing the container and run:
# cd /wallet
# electroneum-wallet-cli
VOLUME /wallet

RUN curl --silent --location https://github.com/electroneum/electroneum/releases/download/v0.11.0.0/linux-x64-0.11.0.0.zip -o app.zip && unzip app*.zip

ENV LOG_LEVEL 0
ENV P2P_BIND_IP 0.0.0.0
ENV P2P_BIND_PORT 26967
ENV RPC_BIND_IP 127.0.0.1
ENV RPC_BIND_PORT 26968

EXPOSE 26967
EXPOSE 26968
COPY run.sh /
HEALTHCHECK --retries=6 --start-period=30s CMD nc -zv 127.0.0.1 26968 || exit 1
CMD /run.sh
#CMD /opt/electroneum-pool/electroneumd --log-level=$LOG_LEVEL --p2p-bind-ip=$P2P_BIND_IP --p2p-bind-port=$P2P_BIND_PORT --rpc-bind-ip=$RPC_BIND_IP --rpc-bind-port=$RPC_BIND_PORT && wait

