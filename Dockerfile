FROM python:3.6-stretch

EXPOSE 5000

RUN apt-get update && apt-get -qy install software-properties-common apache2-dev apache2

RUN mkdir /project

WORKDIR /project

COPY . .

RUN export PIPENV_VENV_IN_PROJECT=true && pip install pipenv && pipenv install --ignore-pipfile

WORKDIR /usr/local/src

RUN wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.6.5.tar.gz && tar -xf 4.6.5.tar.gz

WORKDIR mod_wsgi-4.6.5

RUN ./configure -with-python=/project/.venv/bin/python && make && make install

WORKDIR /project

COPY ./apache/peanuts.conf /etc/apache2/sites-available/peanuts.conf

COPY ./apache/wsgi.load /etc/apache2/mods-available/wsgi.load

RUN mkdir /var/www/peanuts && ln -s /etc/apache2/sites-available/peanuts.conf /etc/apache2/sites-enabled/peanuts.conf && ln -s /etc/apache2/mods-available/wsgi.load /etc/apache2/mods-enabled/wsgi.load && sed -i "s/Listen 80/Listen 5000/g" /etc/apache2/ports.conf

RUN groupadd apachewsgi && useradd --no-log-init -r -g apachewsgi apachewsgi && chown -R apachewsgi peanuts

CMD ["apachectl", "-DFOREGROUND"]
