FROM python:3.10-slim

ARG API_URL

WORKDIR /app

COPY app/. .

RUN apt-get update && apt-get install -y curl unzip --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

RUN reflex init

CMD reflex run --env prod