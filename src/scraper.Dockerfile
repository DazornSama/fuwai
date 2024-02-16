FROM python:3.10-slim

WORKDIR /code

COPY scraper/requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY scraper/. /code/app
COPY utils/. /code/app/utils/.

RUN rm /code/app/requirements.txt

CMD ["python", "-u", "app/main.py"]