#!/bin/bash

set -e

echo "Dowload all service"
sleep 1



DOWLOADS=( "prometheus-3.5.0.linux-amd64.tar.gz" "alertmanager-0.28.1.linux-amd64.tar.gz" "node_exporter-1.7.0.linux-amd64.tar.gz" "grafana-enterprise-12.1.0.linux-amd64.tar.gz" "blackbox_exporter-0.27.0.linux-amd64.tar.gz")


for TAR in "${DOWLOADS[@]}"; do 
    if [ -f $TAR ]; then
        echo "You have $TAR - skip Dowload"
    else
        sudo mkdir -p /opt/prometheus-stack/bin
        sudo mkdir -p /opt/prometheus-stack/configs
        if compgen -G "configs/*" > /dev/null; then
            sudo mv configs/* /opt/prometheus-stack/configs/
        fi
        case "$TAR" in
            ("prometheus-3.5.0.linux-amd64.tar.gz")
                echo "Downloading Prometheus..."
                wget "https://github.com/prometheus/prometheus/releases/download/v3.5.0/$TAR"
                sudo tar xvfz $TAR -C /opt/prometheus-stack/bin
                echo "Delete $TAR"
                rm $TAR
                rm prometheus-3.5.0.linux-amd64
                ;;
            ("alertmanager-0.28.1.linux-amd64.tar.gz")
                echo "Downloading Alertmanager..."
                wget "https://github.com/prometheus/alertmanager/releases/download/v0.28.1/$TAR"
                sudo tar xvfz $TAR -C /opt/prometheus-stack/bin
                echo "Delete $TAR"
                rm $TAR
                rm alertmanager-0.28.1.linux-amd64
                ;;
            ("node_exporter-1.7.0.linux-amd64.tar.gz")
                echo "Downloading Node Exporter..."
                wget "https://github.com/prometheus/node_exporter/releases/download/v1.7.0/$TAR"
                sudo tar xvfz $TAR -C /opt/prometheus-stack/bin
                echo "Delete $TAR"
                rm $TAR
                rm node_exporter-1.7.0.linux-amd64
                ;;
            ("grafana-enterprise-12.1.0.linux-amd64.tar.gz")
                echo "Downloading Grafana..."
                wget https://dl.grafana.com/enterprise/release/$TAR
                sudo tar xvfz $TAR -C /opt/prometheus-stack/bin
                echo "Delete $TAR"
                rm $TAR
                rm grafana-enterprise-12.1.0.linux-amd64
                ;;
            ("blackbox_exporter-0.27.0.linux-amd64.tar.gz")
                echo "Dowload blackbox_exporter"
                wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.27.0/$TAR
                sudo tar xvfz $TAR -C /opt/prometheus-stack/bin
                echo "Delete $TAR"
                rm $TAR
                rm blackbox_exporter-0.27.0.linux-amd64
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
echo "Runing autoload services"
./auto-start-service.sh
read -p "Do you want dont run services autoload? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then service-stop.sh
fi

echo "Script done.Goodbye!"