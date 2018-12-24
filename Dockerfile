FROM python:2.7-stretch

EXPOSE 8333

RUN chown -Rv _apt:root /var/cache/apt/archives/partial/ \
    && chmod -Rv 700 /var/cache/apt/archives/partial/

RUN apt-get update && apt-get -qy install software-properties-common

COPY ./logrotate/bitcoind /etc/logrotate.d/

RUN apt-get update && apt-get -qy install logrotate

RUN cp /etc/cron.daily/logrotate /etc/cron.hourly/

#RUN add-apt-repository -y ppa:bitcoin/bitcoin \
#    && apt-get update \
#    && apt-get -qy install bitcoind

RUN wget https://bitcoin.org/bin/bitcoin-core-0.17.0.1/bitcoin-0.17.0.1-x86_64-linux-gnu.tar.gz \
    && tar xzf bitcoin-0.17.0.1-x86_64-linux-gnu.tar.gz \
    && install -m 0755 -o root -g root -t  /usr/local/bin bitcoin-0.17.0/bin/*

CMD ["bitcoind","-datadir=/data","-prune=551", "-rpcuser=$RPC_USER", "-rpcpassword=$RPC_PASSWORD"]
