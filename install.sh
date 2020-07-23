#!/bin/bash

set -e

PROMETHEUS_VERSION="2.20.0"

printf "Prometheus Version: %s\n\n" "$PROMETHEUS_VERSION"

NODE_EXPORTER_VERSION="1.0.1"

printf "Node Exporter Version: %s\n\n" "$NODE_EXPORTER_VERSION"

WIP="/opt/wip"

mkdir -p $WIP

cd $WIP

wget -q https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz

wget -q https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz

tar xzf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz

tar xzf node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz






# cd ~

# rm -rf $WIP