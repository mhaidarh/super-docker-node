# use the latest LTS (long term support) version of node available from the Docker Hub
FROM mhart/alpine-node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# app binds to port 8080 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 8080

# define the command to run your app using CMD which defines your runtime
CMD [ "npm", "start" ]

