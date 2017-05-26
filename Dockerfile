FROM magentou/luma
MAINTAINER Alan Kent <alan.james.kent@gmail.com>

# TODO: DevBox seems to have an ancient version of Node.js (remove the following when updated)
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential

# From https://github.com/graphql/express-graphql
RUN mkdir /usr/local/graphql \
 && cd /usr/local/graphql \
 && echo "{}" > package.json \
 && npm install --save graphql express graphql-server-express express-graphiql

RUN echo "" >> /etc/supervisord.conf
RUN echo "[program:graphiql]" >> /etc/supervisord.conf
RUN echo "command = /usr/local/graphql/graphiql.sh" >> /etc/supervisord.conf

ADD server.js /usr/local/graphql/server.js
ADD graphiql.sh /usr/local/graphql/graphiql.sh
RUN chmod +x /usr/local/graphql/graphiql.sh

ADD install-graphql.sh /usr/local/bin/install-graphql.sh
RUN chmod +x /usr/local/bin/install-graphql.sh

EXPOSE 4000
