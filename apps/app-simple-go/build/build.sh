#!/bin/bash

rm -f ./swagger-ui.tgz
cd ../src/simpleapi ; tar cvfz ../../build/swagger-ui.tgz public
cp simpleapi ../../build
cp gen/http/openapi3.json ../../build
cd ../../build
docker build . -t registry.lab.local/openshift/simpleapi:1.3.0
