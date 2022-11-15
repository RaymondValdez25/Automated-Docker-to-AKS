FROM keymetrics/pm2:latest-alpine

# Bundle APP files
COPY data data/
COPY ServerSide ServerSide/

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

# Expose the listening port of your app
#EXPOSE 8000
EXPOSE 3000

# Show current folder structure in logs
RUN ls -al -R
RUN ls
RUN npm install pm2 -g 

CMD ["pm2-runtime", "ServerSide/server.js"]