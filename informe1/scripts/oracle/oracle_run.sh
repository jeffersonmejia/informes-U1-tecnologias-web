#!/bin/bash

set -e

CONTAINER_NAME="sqlserver"

start_docker() {
    echo "[1] Iniciando Docker..."
    sudo systemctl start docker
}

start_sqlserver() {
    echo "[2] Iniciando SQL Server..."
    sudo docker start "$CONTAINER_NAME"
}

verify_container() {
    echo "[3] Verificando contenedor..."

    sleep 5

    sudo docker ps | grep "$CONTAINER_NAME" && \
    echo "SQL Server ejecutandose correctamente."
}

show_connection_info() {
    echo
    echo "======================================="
    echo "SQL SERVER ACTIVO"
    echo "======================================="
    echo "Servidor : localhost"
    echo "Puerto    : 1433"
    echo "Usuario   : sa"
    echo
    echo "JDBC:"
    echo "jdbc:sqlserver://localhost:1433;encrypt=true;trustServerCertificate=true"
    echo
    echo "DBeaver:"
    echo "Host      : localhost"
    echo "Port      : 1433"
    echo "Encrypt   : true"
    echo "TrustServerCertificate : true"
    echo "======================================="
}

main() {
    start_docker
    start_sqlserver
    verify_container
    show_connection_info
}

main