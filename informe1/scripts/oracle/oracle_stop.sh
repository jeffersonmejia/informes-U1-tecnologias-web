#!/bin/bash

set -e

stop_containers() {
    echo "[1] Deteniendo contenedores activos..."

    CONTAINERS=$(sudo docker ps -q)

    if [ -n "$CONTAINERS" ]; then
        sudo docker stop $CONTAINERS
        echo "Contenedores detenidos."
    else
        echo "No hay contenedores activos."
    fi
}

stop_docker_services() {
    echo "[2] Apagando servicios Docker..."

    sudo systemctl stop docker.service
    sudo systemctl stop docker.socket
    sudo systemctl stop containerd.service

    echo "Servicios Docker detenidos."
}

verify_shutdown() {
    echo "[3] Verificando apagado..."

    if ! systemctl is-active --quiet docker; then
        echo "Docker apagado correctamente."
    else
        echo "Docker sigue activo."
    fi
}

main() {
    stop_containers
    stop_docker_services
    verify_shutdown
}

main