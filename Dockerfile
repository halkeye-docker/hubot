FROM node:15.4.0-alpine


RUN apk add --no-cache --update python make g++ && \
      rm -rf /var/cache/apk/*
RUN addgroup -g 501 hubot && adduser -D -h /hubot -u 501 -G hubot hubot
ENV HOME /hubot
WORKDIR /hubot
RUN chown -R hubot:hubot .
USER hubot

ENV HUBOT_NAME threepwood
ENV EXPRESS_PORT 8000
EXPOSE 8000

COPY package.json package-lock.json external-scripts.js ./
RUN node external-scripts.js > external-scripts.json
RUN npm install --production

# Set up mandatory environment variables defaults
ENTRYPOINT ["npm", "run", "start"]
