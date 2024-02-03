#!/bin/bash

set -e

PROMETHEUS_VERSION="2.49.1"

printf "Prometheus Version: %s\n\n" "$PROMETHEUS_VERSION"

printf "Starting...\n\n"

WIP="/opt/wip"

mkdir -p $WIP

cd $WIP

wget -q https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz

tar xzf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz

wget -q https://raw.githubusercontent.com/edufolly/prometheus_install/master/prometheus.service

wget -q https://raw.githubusercontent.com/edufolly/prometheus_install/master/prometheus.yml

useradd -M -r -s /bin/false prometheus

mkdir /etc/prometheus /var/lib/prometheus

cp prometheus-$PROMETHEUS_VERSION.linux-amd64/{prometheus,promtool} /usr/local/bin/

chown prometheus:prometheus /usr/local/bin/{prometheus,promtool}

cp -r prometheus-$PROMETHEUS_VERSION.linux-amd64/{consoles,console_libraries} /etc/prometheus/

cp prometheus.yml /etc/prometheus/prometheus.yml

chown -R prometheus:prometheus /etc/prometheus

chown prometheus:prometheus /var/lib/prometheus

cp prometheus.service /etc/systemd/system/prometheus.service

systemctl daemon-reload

systemctl enable prometheus

systemctl start prometheus

cd ~

rm -rf $WIP

printf "Finished!!\n"
