#!/bin/sh

docker build -t alankent/graphql . 2>&1 | tee log.txt
