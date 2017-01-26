#!/bin/bash

echo "hab config apply --peer $1 mongodb.default 1 config/mongo.toml"
hab config apply --peer $1 mongodb.default 1 config/mongo.toml