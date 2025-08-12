#!/bin/bash
set -e


echo "Cleaning port..."
fuser -k 9090/tcp || true # Prometheus
fuser -k 9093/tcp || true # Alertmanager
fuser -k 3000/tcp || true # Grafana
fuser -k 9100/tcp || true # Node Exporter


read -p "For Starting Prometheus services with Grafana: Write y; " Start
if [ $Start == "y" ]; then
    # Prometheus
    ./prometheus-3.5.0.linux-amd64/prometheus --config.file=configs/prometheus.yml &

    # Node Exporter
    ./node_exporter-1.7.0.linux-amd64/node_exporter &

    # Alertmanager
    ./alertmanager-0.28.1.linux-amd64/alertmanager --config.file=configs/alertmanager.yml &

    #Blackbox
    ./blackbox_exporter-0.27.0.linux-amd64/blackbox_exporter --config.file=configs/blackbox.yml &

    # Grafana
    ./grafana-v12.1.0/bin/grafana-server --homepath="./grafana-v12.1.0" & 

    sleep 5

    echo "Opening Prometheus UI in browser..."
    xdg-open http://localhost:9090

    echo "Opening Grafana UI in browser..."
    xdg-open http://127.0.0.1:3000/login
else
    echo "Goodbye! all services kill"
fi


