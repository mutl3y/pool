FROM ubuntu:17.10

WORKDIR /opt/electroneum-pool

EXPOSE 80

ENV NAME electroneum-pool

# Update package
RUN  apt-get -qq update \
  && apt-get install -y wget curl git apt-utils \
  && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install --yes nodejs \
  && apt-get install --yes build-essential

# Install libssl, boost
RUN apt-get install -y libssl-dev libboost-all-dev

# install electroneum pool
RUN \
  cd /opt/electroneum-pool \
  && git clone https://github.com/sunscreen/node-cryptonote-pool.git pool
RUN cd pool \
  && npm install -g n
COPY config.json /opt/electroneum-pool/pool/config.json
 RUN  cd /opt/electroneum-pool/pool &&  n 0.10.36 \
  && npm update

WORKDIR /opt/electroneum-pool/pool/
CMD [ "/usr/local/bin/node", "init.js"]
