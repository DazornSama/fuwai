FROM python:3.10-slim

WORKDIR /code

COPY src/scraper/requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY src/scraper/. /code/app
COPY src/utils/. /code/app/utils/.

RUN rm /code/app/requirements.txt

CMD ["python", "-u", "app/main.py"]