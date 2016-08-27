FROM gmist/gcloud-app-engine-python:latest
MAINTAINER Serg Baburin <dev@babur.in>

# prepare requirements
RUN apk add --update \
  git \
  nodejs \
  py-pip \
  && update-ca-certificates \
  && pip install --upgrade pip \
  && pip install virtualenv \
  && pip install virtualenvwrapper \
  && rm /var/cache/apk/*

# tune npm and install Gulp
RUN echo 'unsafe-perm = true' >> /root/.npmrc \
  && npm install -g gulp

# create app directory
RUN mkdir /var/app
WORKDIR /var/app
