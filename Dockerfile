FROM python:3.11-slim-bookworm

ENV TZ=Asia/Dhaka
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends 
RUN pip install --no-cache-dir -U pip wheel==0.45.1
RUN pip install -U -r requirements.txt
RUN mkdir /ndfwdbot
WORKDIR /ndfwdbot
COPY . /ndfwdbot
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]


CMD gunicorn app:app & python3 bot.py

CMD flask run -h 0.0.0.0 -p 5000 





