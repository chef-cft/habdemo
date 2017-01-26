#!/bin/bash

echo "hab config apply --peer $1 haproxy.default 1 config/haproxy.toml"
hab config apply --peer $1 haproxy.default 1 config/haproxy.toml
