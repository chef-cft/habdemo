#!/bin/bash

docker run -it -e HAB_MONGODB="$(cat ../config/mongo.toml)" -p 27017:27017 core/mongodb
