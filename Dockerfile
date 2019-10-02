FROM python:3.6-stretch

EXPOSE 5000

RUN apt-get update && apt-get -qy install software-properties-common

RUN mkdir /project

WORKDIR /project

COPY . .

RUN export PIPENV_VENV_IN_PROJECT=true && pip install pipenv && pipenv install --ignore-pipfile

RUN groupadd peanuts && useradd --no-log-init -r -g peanuts peanuts && chown -R peanuts peanuts

RUN su - peanuts

CMD ["su", "-c", "pipenv", "run", "python", "run_peanuts_wsgi.py", "peanuts"]
