FROM node:22.19.0-bullseye-slim

WORKDIR /home/node/portfolio

USER root

RUN npm i -g npm@11.6.0

RUN chown -R node:node /home/node/portfolio

RUN npx playwright install-deps
RUN npx playwright install

USER node