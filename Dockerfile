FROM python:2.7-stretch

EXPOSE 5000

RUN apt-get update && apt-get -qy install software-properties-common

RUN pip install python-bitcoinrpc Flask

RUN mkdir /project

WORKDIR /project

COPY . .

RUN chown -R root .

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
