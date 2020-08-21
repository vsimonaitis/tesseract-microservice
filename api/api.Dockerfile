FROM node:12

EXPOSE 3000

# Create app directory
WORKDIR /app
ADD . /app

# Install app dependencies
RUN npm install -g nodemon
RUN npm install --production

CMD ["npm", "start"]