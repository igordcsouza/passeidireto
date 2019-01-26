FROM node:8
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY server.js ./
ENV NODEJS_API_PORT 8080
EXPOSE 8080
CMD [ "node", "server.js" ]