FROM magentou/luma
MAINTAINER Alan Kent <akent@magento.com>

# TODO: DevBox seems to have an ancient version of Node.js (remove the following when updated)
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential

# From https://github.com/graphql/express-graphql
RUN mkdir /usr/local/graphql \
 && cd /usr/local/graphql \
 && echo "{}" > package.json \
 && npm install --save graphql express graphql-server-express express-graphiql
RUN echo "(cd /usr/local/graphql ; nodejs server.js) &" >> /usr/local/bin/entrypoint.sh

ADD server.js /usr/local/graphql/server.js

EXPOSE 4000
