// Run GraphIQL (the GraphQL IDE) on port 4000

var express          = require('express');
var graphiqlExpress  = require('graphql-server-express').graphiqlExpress;

var url = 'http://127.0.0.1/graphql';

var app = express();
app.use('/', graphiqlExpress({
  endpointURL: url,
}));

app.listen(4000);
