FROM python:3.7.4-alpine3.10

ENV PYTHONUNBUFFERED 1

RUN apk update
RUN apk --no-cache add jpeg-dev zlib-dev postgresql-dev gcc python3-dev musl-dev
RUN apk --no-cache add --virtual build-deps build-base linux-headers

COPY ./requirements.txt /
RUN pip install -r /requirements.txt

RUN mkdir code
WORKDIR /code
COPY . /code

EXPOSE 8000
