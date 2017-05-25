// From http://graphql.org/graphql-js/running-an-express-graphql-server/
// And https://stackoverflow.com/questions/40451636/inspecting-a-remote-graphql-endpoint-with-graphiql
// And http://dev.apollodata.com/tools/graphql-server/graphiql.html


//import express from 'express';
//import { graphiqlExpress } from 'graphql-server-express';
var express            = require('express');
var graphiqlExpress    = require('graphql-server-express').graphiqlExpress;

var url = 'http://localhost/graphql';

var app = express();
app.use('/graphiql', graphiqlExpress({
  endpointURL: url,
}));

app.listen(4000);



//var buildClientSchema  = require('graphql/utilities').buildClientSchema;
//var introspectionQuery = require('graphql/utilities').introspectionQuery;
//var request            = require('sync-request');
//var express            = require('express');
//var graphqlHTTP        = require('express-graphql');

//var response = request('POST', url, { qs: { query: introspectionQuery } });
//var introspectionResult = JSON.parse(response.body.toString('utf-8'));
//var schema = buildClientSchema(introspectionResult);

//var app = express();

//app.use(express.static(__dirname));
//app.use('/graphiql', graphqlExpress({
  //endpointURL: url,
  //schema: schema,
  //rootValue: root,
  //graphiql: true,
//}));
//app.use('/graphql', graphqlHTTP({
  //schema: schema,
  //rootValue: root,
  //graphiql: true,
//}));
//app.listen(4000);
