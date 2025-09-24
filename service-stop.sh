#!/bin/bash
set -e

сleaning() {
    echo "Cleaning port..." 
    fuser -k 9090/tcp || true # Prometheus
    fuser -k 9093/tcp || true # Alertmanager
    fuser -k 3000/tcp || true # Grafana
    fuser -k 9100/tcp || true # Node Exporter
}

echo "Stopping services..."
for svc in grafana prometheus alertmanager node_exporter blackbox_exporter; do

    sudo systemctl stop $svc || true
    sudo systemctl disable $svc || true
    cleaning
done

read -p "Delete installation in /opt/prometheus-stack? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cleaning
    sudo rm -rf /opt/prometheus-stack
    sudo rm etc/systemd/system/alertmanager.service
    sudo rm etc/systemd/system/prometheus.service
    sudo rm etc/systemd/system/node_exporter.service
    sudo rm etc/systemd/system/blackbox_exporter.service
    sudo rm etc/systemd/system/grafana.service
    sudo systemctl daemon-reload
    echo "Deleted /opt/prometheus-stack"
fi
echo "All services stopped. Goodbye!"