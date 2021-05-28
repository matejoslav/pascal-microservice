FROM debian:buster-slim



ENV APP_HOME /app
WORKDIR $APP_HOME

COPY . ./

RUN apt-get update -y -q
RUN apt-get install -y -q fpc

RUN fpc microservice.pas

EXPOSE 9080

CMD ["/app/microservice"]
