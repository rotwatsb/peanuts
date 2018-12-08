FROM ubuntu:cosmic

EXPOSE 8333

RUN add-apt-repository -y ppa:bitcoin/bitcoin
    && apt-get update
    && apt-get -qy install bitcoin

COPY . .

RUN chown -R user:user .
