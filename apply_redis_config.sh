#!/bin/bash

echo "hab config apply --peer $1 mongodb.default 1 configs/mongo.toml"
hab config apply --peer $1 redis.default 1 configs/redis.toml
