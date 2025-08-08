# my-prometheus

# Prometheus & Grafana Docker Monitoring Stack

### Project Description
This project provides a ready-to-use monitoring stack, including Prometheus, Grafana, and Node Exporter. It's designed for quick local deployment using Docker Compose.

---

### Prerequisites
To run this project, you need to have:
* [**Docker**](https://docs.docker.com/get-docker/) (with Docker Compose installed)

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
    chmod +x start_prometheus.sh # +Execute
    ./start_prometheus.sh #Opening Prometheus with Grafana UI in browser...

    docker-compose up -d #It builds, creates, and starts the containers for all the services defined in your docker-compose.yml file.
    ```
    This will pull the necessary images, run the containers, and configure them.

3.  **Optional: Desktop Shortcut for Linux (.desktop file)**

    ```bash
    cp Prometheus.desktop ~/
    chmod +x ~/Prometheus.desktop
    ```
    !Now you can move it from your home directory to your desktop!

---

### Access the UIs
Once the stack is running, you can access the services at these addresses:

* **Prometheus UI**: [http://localhost:9090](http://localhost:9090)
* **Grafana UI**: [http://localhost:3000](http://localhost:3000)

---

### File Structure
The repository contains the following key files:
* **`docker-compose.yml`**: The main file that defines and runs all services.
* **`config/`**: A folder for Prometheus configuration files.
* **`config/prometheus.yml`**: The main Prometheus configuration file.
* **`alertmanager.yml`**: Configuration for Alertmanager.
* **`node_exporter_rules.yml`**: Alerting rules for Node Exporter metrics.
* **`start_prometheus.sh`**: A script for easy startup and shutdown of the stack.

---

### Adding New Exporters
To add a new exporter (e.g., for a database), simply add its service to `docker-compose.yml` and update `prometheus.yml` with a new `job` in the `scrape_configs` section.

```bash
# Example: Restart the stack after making changes
<<<<<<< HEAD
docker-compose up -d --force-recreate
=======
docker compose up -d --force-recreate
>>>>>>> 7168153 (Fix)
