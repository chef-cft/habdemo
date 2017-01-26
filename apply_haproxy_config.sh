#!/bin/bash

echo "hab config apply --peer $1 haproxy.default 1 configs/haproxy.toml"
hab config apply --peer $1 haproxy.default 1 configs/haproxy.toml
