FROM python:3.10-slim

WORKDIR /code

COPY src/api/requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY src/api/. /code/app
COPY src/utils/. /code/app/utils/.

RUN rm /code/app/requirements.txt

CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]