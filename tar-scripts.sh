#!/bin/bash

set -e

echo "Dowload all service"
sleep 1

wget https://github.com/prometheus/prometheus/releases/download/v2.48.0/prometheus-2.48.0.linux-amd64.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-12.1.0.linux-amd64.tar.gz

AMD64 = ("prometheus-3.5.0.linux-amd64" "alertmanager-0.28.1.linux-amd64" "node_exporter-1.7.0.linux-amd64" "grafana-v12.1.0")

for TAR in $AMD64; do 
    if [ -d "$TAR"];then
        echo "You have $TAR - skip unboxing"

    elif [-d "$TAR" == "grafana-v12.1.0"]; then
        echo "Unboxing grafana"
        tar xvfz grafana-enterprise-12.1.0.linux-amd64.tar.gz

    else
        echo "Unboxing $TAR"
        tar xvfz $TAR.tar.gr

    fi

done

echo "Unboxing done"
echo "====================================="
echo "Runing services"
./start_prometheus.sh