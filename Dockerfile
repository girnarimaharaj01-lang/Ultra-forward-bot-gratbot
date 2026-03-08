FROM python:3.10.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN mkdir /ndfwdbot
WORKDIR /ndfwdbot
COPY . /ndfwdbot


CMD gunicorn app:app & python3 bot.py

CMD flask run -h 0.0.0.0 -p 5000 



