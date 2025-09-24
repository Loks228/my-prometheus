# Monitoring Stack
Prometheus + Grafana + Alertmanager + Node_exporter + Black_box
---------------------------------------------

### How to Run
Follow these simple steps to start monitoring:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Loks228/my-prometheus.git
    cd my-prometheus
    ```
2.  **Configs and alert:**
    ```bash
    #All configs storage directory /configs
    #Alert for Prometheus in /configs
    #Do you need aler rules tune in Grafana
        
2.  **Run all services:**
    ```bash
    chmod +x *.sh # +Execute

    # First script
    ./instaler.sh # Dowload all Monitoring Stack


    # Second scripts for delete or stop all service 
    ./service-stop.sh


---

### Access the UIs
Once the stack is running, you can access the services at these addresses:

* **Prometheus UI**: [http://localhost:9090](http://localhost:9090)
* **Grafana UI**: [http://localhost:3000](http://localhost:3000)


