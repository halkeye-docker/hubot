FROM node:12.6-alpine

RUN addgroup -g 501 hubot && adduser -D -h /hubot -u 501 -G hubot hubot
ENV HOME /hubot
WORKDIR /hubot
RUN chown -R hubot:hubot .
USER hubot

ENV HUBOT_NAME threepwood
ENV EXPRESS_PORT 8000
EXPOSE 8000

COPY package.json external-scripts.json ./
RUN npm install

# Set up mandatory environment variables defaults
ENTRYPOINT ["npm", "run", "start"]
