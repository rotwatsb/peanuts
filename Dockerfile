FROM python:2.7-stretch

EXPOSE 8333

EXPOSE 5000

RUN chown -Rv _apt:root /var/cache/apt/archives/partial/ \
    && chmod -Rv 700 /var/cache/apt/archives/partial/

RUN apt-get update && apt-get -qy install software-properties-common

COPY ./logrotate/bitcoind /etc/logrotate.d/

RUN apt-get update && apt-get -qy install logrotate

RUN cp /etc/cron.daily/logrotate /etc/cron.hourly/

RUN pip install python-bitcoinrpc Flask

RUN wget https://bitcoin.org/bin/bitcoin-core-0.17.0.1/bitcoin-0.17.0.1-x86_64-linux-gnu.tar.gz \
    && tar xzf bitcoin-0.17.0.1-x86_64-linux-gnu.tar.gz \
    && install -m 0755 -o root -g root -t  /usr/local/bin bitcoin-0.17.0/bin/*

RUN mkdir /project

WORKDIR /project

COPY . .

RUN chown -R root .

CMD ./run_peanuts.sh
