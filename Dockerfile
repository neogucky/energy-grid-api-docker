FROM nodejs:wheezy

MAINTAINER Tim Rasim "rasim@imis.uni-luebeck.de"

# Prepare for mongo
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# Update
RUN apt-get update

# Install software 
RUN apt-get install -y git mongodb-org

# Make ssh dir
RUN mkdir /root/.ssh/
RUN chown -R root:root /root/.ssh

# Create known_hosts
RUN touch /root/.ssh/known_hosts

# Remove host checking
RUN echo "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# Clone the conf files into the docker container
RUN git clone https://github.com/neogucky/energy-grid-api /home/energy-grid-api

#install deployd 
RUN npm install deployd -g

#start deployd
RUN cd /home/energy-grid-api/netz-daten-strom/
RUN sudo dpd --mongod mongod
