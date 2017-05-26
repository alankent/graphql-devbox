// Run GraphIQL (the GraphQL IDE) on port 4000

var express            = require('express');
var graphiqlExpress    = require('graphql-server-express').graphiqlExpress;
var buildClientSchema  = require('graphql/utilities').buildClientSchema;
var introspectionQuery = require('graphql/utilities').introspectionQuery;
var request            = require('sync-request');

var url = 'http://127.0.0.1/graphql';

var response = request('POST', url, { qs: { query: introspectionQuery } });
// Assuming we're waiting for the above request to finish (await maybe)
var introspectionResult = JSON.parse(response.body.toString('utf-8'));
var schema = buildClientSchema(introspectionResult);

var app = express();
app.use('/', graphiqlExpress({
  schema: schema
}));

app.listen(4000);
