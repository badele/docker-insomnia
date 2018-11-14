FROM ubuntu:18.04
#FROM node:11.1-stretch

# Install nodejs
RUN apt-get clean 
RUN apt-get update
RUN apt-get -y --fix-missing upgrade

RUN apt-get install -y wget apt-transport-https git npm nodejs 


#Install required packages (for insomnia installation)
RUN apt-get install -y libcurl4-gnutls-dev libfontconfig1-dev libgtk-3-0 libxss1 libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev

# Install electron
RUN npm install -g electron

# Install insomnia

RUN cd /opt && git clone https://github.com/getinsomnia/insomnia.git && cd insomnia

RUN cd /opt/insomnia && npm run bootstrap
#&& npm test

ENV DISPLAY :0
WORKDIR /opt/insomnia
CMD npm run app-start
