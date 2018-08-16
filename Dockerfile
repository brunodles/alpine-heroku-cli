FROM node:10.6.0-alpine
MAINTAINER Stafford Brunk <stafford.brunk@gmail.com>
LABEL version='7.7.10'
LABEL description='Heroku CLI packaged on alpine linux'

ENV HEROKU_CLI_VERSION '7.7.10'
RUN yarn global add heroku@$HEROKU_CLI_VERSION
RUN apk add --no-cache git

ENTRYPOINT ["/usr/local/bin/heroku"]
