FROM ubuntu:latest

WORKDIR /usr/src/app
RUN \
  apt -q update && \
  apt -q install -y git python3 python3-pip curl ffmpeg locales

COPY requirements-heroku.txt .
RUN pip3 install -U pip setuptools wheel

RUN pip3 install -Ur requirements-heroku.txt

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY . .

CMD ["python3", "-m", "userlixo"]
