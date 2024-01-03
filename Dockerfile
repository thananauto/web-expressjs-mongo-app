FROM  node:alpine3.19
#Argument that is passed from docer-compose.yaml file
ARG NODE_PORT
#Echo the argument to check passed argument loaded here correctly
RUN echo "Argument port is : $NODE_PORT"

WORKDIR /home/app 
COPY . /home/app
# install all dependencies or use npm ci

RUN npm install

EXPOSE ${NODE_PORT}

ENTRYPOINT [ "npm", "run" ]
# currently we have 'start' tag in package.json, in feature we can override during container run time
CMD [ "start" ]