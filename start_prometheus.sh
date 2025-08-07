#!/bin/bash

echo "Starting Prometheus services with Grafana..."
docker-compose up -d

echo "Opening Prometheus UI in browser..."
open http://localhost:9090

echo "Opening Grafana UI in browser..."
open http://127.0.0.1:3000/login
