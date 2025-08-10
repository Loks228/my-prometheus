#!/bin/bash

set -e

echo "Dowload all service"
sleep 1



DOWLOADS=( "prometheus-3.5.0.linux-amd64.tar.gz" "alertmanager-0.28.1.linux-amd64.tar.gz" "node_exporter-1.7.0.linux-amd64.tar.gz" "grafana-enterprise-12.1.0.linux-amd64.tar.gz" )

for TAR in "${DOWLOADS[@]}"; do 
    if [ -f $TAR ]; then
        echo "You have $TAR - skip Dowload"
    else
        case "$TAR" in
            ("prometheus-3.5.0.linux-amd64.tar.gz")
                echo "Downloading Prometheus..."
                wget "https://github.com/prometheus/prometheus/releases/download/v3.5.0/$TAR"
                tar xvfz $TAR
                echo "Delete $TAR"
                rm $TAR
                ;;
            ("alertmanager-0.28.1.linux-amd64.tar.gz")
                echo "Downloading Alertmanager..."
                wget "https://github.com/prometheus/alertmanager/releases/download/v0.28.1/$TAR"
                tar xvfz $TAR
                echo "Delete $TAR"
                rm $TAR
                ;;
            ("node_exporter-1.7.0.linux-amd64.tar.gz")
                echo "Downloading Node Exporter..."
                wget "https://github.com/prometheus/node_exporter/releases/download/v1.7.0/$TAR"
                tar xvfz $TAR
                echo "Delete $TAR"
                rm $TAR
                mv prometheus.yml prometheus-3.5.0.linux-amd64/prometheus.yml
                ;;
            ("grafana-enterprise-12.1.0.linux-amd64.tar.gz")
                echo "Downloading Grafana..."
                wget https://dl.grafana.com/enterprise/release/$TAR
                tar -zxvf $TAR
                echo "Delete $TAR"
                rm $TAR
                ;;
            ("*.*")
                echo "Unknown file specified: $TAR"
                exit 1
                ;;
        esac
    fi

done

echo "Unboxing done"
echo "====================================="
echo "Runing services"
sleep 1
./start_prometheus.sh