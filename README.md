# my-prometheus

# Prometheus & Grafana Docker Monitoring Stack

---

### How to Run
Follow these simple steps to start monitoring:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Loks228/my-prometheus.git
    cd my-prometheus
    ```
2.  **Run all services:**
    ```bash
    chmod +x *.sh # +Execute

    # First script
    ./tar-scripts.sh # Dowload and runing all services with ./start_prometheus.sh


    # Second scripts for following starts all service 
    ./start_prometheus.sh #Opening Prometheus with Grafana UI in browser...


---

### Access the UIs
Once the stack is running, you can access the services at these addresses:

* **Prometheus UI**: [http://localhost:9090](http://localhost:9090)
* **Grafana UI**: [http://localhost:3000](http://localhost:3000)


