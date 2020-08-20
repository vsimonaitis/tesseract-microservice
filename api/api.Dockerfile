FROM ubuntu:20.04

RUN apt-get update && apt-get install -y apt-utils

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install --yes nodejs

RUN npm install -g nodemon

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN cd /app
RUN npm install


EXPOSE 3000

CMD ["npm", "start"]