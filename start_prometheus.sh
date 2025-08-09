#!/bin/bash
set -e

echo "Starting Prometheus services with Grafana..."

# Prometheus
./prometheus-3.5.0.linux-amd64/prometheus --config.file=./prometheus.yml &

# Node Exporter
./node_exporter-1.7.0.linux-amd64/node_exporter &

# Alertmanager
./alertmanager-0.28.1.linux-amd64/alertmanager &

# Grafana
./grafana-enterprise-12.1.0.linux-amd64/bin/grafana-server &

sleep 5

echo "Opening Prometheus UI in browser..."
open http://localhost:9090

echo "Opening Grafana UI in browser..."
open http://127.0.0.1:3000/login



