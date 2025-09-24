#!/bin/bash

set -e

echo "Move Service in Load"

if compgen -G "load-service/*" > /dev/null; then
    sudo mv load-service/* /etc/systemd/system/
fi


echo "Auto-load"
sudo systemctl daemon-reload

for SERVICE in alertmanager blackbox_exporter node_exporter prometheus grafana; do
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running, restarting..."
        sudo systemctl restart $SERVICE
    else
        echo "$SERVICE is not running, starting..."
        sudo systemctl start $SERVICE
    fi
done
echo "Status All Service"
echo systemctl status alertmanager
echo systemctl status node_exporter
echo systemctl status blackbox_exporter
echo systemctl status grafana       
echo systemctl status prometheus

echo "Script done.Goodbye!"
