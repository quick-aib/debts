FROM ubuntu
firest update
RUN apt update
ADD ./app
WORKDIR /app
