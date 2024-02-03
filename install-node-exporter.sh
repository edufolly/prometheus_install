#!/bin/bash

set -e

NODE_EXPORTER_VERSION="1.7.0"

printf "Node Exporter Version: %s\n\n" "$NODE_EXPORTER_VERSION"

printf "Starting...\n\n"

WIP="/opt/wip"

mkdir -p $WIP

cd $WIP

wget -q https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz

tar xzf node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz

wget -q https://raw.githubusercontent.com/edufolly/prometheus_install/master/node_exporter.service

useradd -M -r -s /bin/false node_exporter

cp node_exporter-$NODE_EXPORTER_VERSION.linux-amd64/node_exporter /usr/local/bin/

chown node_exporter:node_exporter /usr/local/bin/node_exporter

cp node_exporter.service /etc/systemd/system/node_exporter.service

systemctl daemon-reload

systemctl enable node_exporter

systemctl start node_exporter

cd ~

rm -rf $WIP

printf "Finished!!\n"
