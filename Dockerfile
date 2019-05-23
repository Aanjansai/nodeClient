FROM node:12.2.0-alpine

RUN mkdir -p /srv/app/node-client
WORKDIR /srv/app/node-client

COPY package.json /srv/app/node-client
COPY package-lock.json /srv/app/node-client

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base 

RUN apk fetch openjdk8
RUN apk add openjdk8
RUN apk update

RUN npm install bcrypt --save
RUN npm rebuild
RUN npm install

EXPOSE 3000

COPY . /srv/app/node-client

CMD ["npm", "start"]

