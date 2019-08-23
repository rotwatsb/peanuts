FROM python:3.6-stretch

EXPOSE 5000

RUN apt-get update && apt-get -qy install software-properties-common

RUN mkdir /project

WORKDIR /project

COPY . .

RUN pip install pipenv && pipenv install --ignore-pipfile

RUN chown -R root .

CMD ["pipenv", "run", "flask", "run", "--host=0.0.0.0", "--port=5000"]
