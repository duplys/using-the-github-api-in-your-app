FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ENV SMEE_URL="https://smee.io/qrfeVRbFbffd6vD"

RUN apt update && \
    apt install npm -y && \
    apt install ruby-full -y && \
    rm -rf /var/lib/apt/lists/* && \
    npm install --global smee-client && \
    gem install bundler && \
    bundle update --bundler

WORKDIR /opt/github-app
COPY ./Gemfile /opt/github-app
RUN bundle install
#RUN echo ${SMEE_URL}

#RUN smee --url ${SMEE_URL} --path /event_handler --port 3000

#ENTRYPOINT ["smee", "--url ${SMEE_URL}", "--path /event_handler", "--port 3000"]
