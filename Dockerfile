FROM irvingpop/gcloud-app-engine-python:latest

# prepare requirements
RUN apk add --update \
  git \
  bash \
  tini \
  py-pip \
  && update-ca-certificates \
  && pip install --upgrade pip \
  && pip install virtualenv virtualenvwrapper pipenv \
  && rm /var/cache/apk/* \
  && rm -r /root/.cache

# tune npm and install Gulp
RUN echo 'unsafe-perm = true' >> /root/.npmrc \
  && echo '{ "allow_root": true }' > /root/.bowerrc \
  && npm install -g gulp

# create app directory
RUN mkdir /var/app
WORKDIR /var/app

EXPOSE 8080
EXPOSE 8081
EXPOSE 3000
EXPOSE 3001

ENTRYPOINT ["/sbin/tini", "--"]
