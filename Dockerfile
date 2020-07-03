FROM python:3.6-buster

WORKDIR app
ENV CONDUIT_SECRET='something-really-secret'
ENV FLASK_APP=/app/autoapp.py
ENV FLASK_DEBUG=1

COPY ./conduit /app/conduit
COPY ./requirements /app/requirements
COPY ./tests /app/tests
COPY ./autoapp.py /app/autoapp.py
COPY ./Procfile /app/Procfile
COPY ./requirements.txt /app/requirements.txt
COPY ./setup.cfg /app/setup.cfg

RUN pip install -r /app/requirements.txt

RUN flask db init
RUN flask db migrate
RUN flask db upgrade
EXPOSE 5000/tcp
