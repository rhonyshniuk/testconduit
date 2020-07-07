FROM python:3.6-buster

WORKDIR app
ENV CONDUIT_SECRET='something-really-secret'
ENV FLASK_APP=/app/autoapp.py
ENV FLASK_DEBUG=1

COPY . /app

RUN pip install -r /app/requirements.txt

EXPOSE 5000/tcp
