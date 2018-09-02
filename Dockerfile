FROM gmist/gcloud-app-engine-python:v214.0.0
MAINTAINER Serg Baburin <dev@babur.in>

# prepare requirements
RUN apk add --update \
  git \
  py-pip \
  && update-ca-certificates \
  && pip install --upgrade pip \
  && pip install virtualenv \
  && pip install virtualenvwrapper \
  && rm /var/cache/apk/* \
  && rm -r /root/.cache

# tune npm and install Gulp
RUN echo 'unsafe-perm = true' >> /root/.npmrc \
  && echo '{ "allow_root": true }' > /root/.bowerrc \
  && npm install -g gulp

# create app directory
RUN mkdir /var/app
WORKDIR /var/app
