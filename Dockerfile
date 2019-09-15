FROM node:10.13-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["smartthings-nodeproxy/package.json", "smartthings-nodeproxy/server.js", "./"]
RUN mkdir -p plugins \
&& npm install --production --silent && mv node_modules ../

COPY smartthings-nodeproxy/avail_plugins/envisalink.js ./plugins
COPY smartthings-nodeproxy/config.json config.json

EXPOSE 8080

CMD npm run start