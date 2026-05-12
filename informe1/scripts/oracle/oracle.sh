#!/bin/bash

set -e

CONTAINER_NAME="sqlserver"
IMAGE_NAME="mcr.microsoft.com/mssql/server:2022-latest"
SA_PASSWORD="SqlServer2525*"
SQL_PORT="1433"

check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Ejecuta este script con sudo."
        exit 1
    fi
}

update_system() {
    echo "[1] Actualizando paquetes..."
    apt update
}

install_docker() {
    echo "[2] Instalando Docker..."

    if command -v docker >/dev/null 2>&1; then
        echo "Docker ya esta instalado."
        return
    fi

    apt install docker.io -y
    systemctl enable --now docker
}

start_docker() {
    echo "[3] Iniciando Docker..."
    systemctl start docker
}

download_sqlserver_image() {
    echo "[4] Descargando imagen de SQL Server..."
    docker pull "$IMAGE_NAME"
}

remove_old_container() {
    echo "[5] Eliminando contenedor anterior si existe..."

    if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
        docker rm -f "$CONTAINER_NAME"
    fi
}

create_sqlserver_container() {
    echo "[6] Creando contenedor SQL Server..."

    docker run \
        -e "ACCEPT_EULA=Y" \
        -e "MSSQL_SA_PASSWORD=${SA_PASSWORD}" \
        -p ${SQL_PORT}:1433 \
        --name "$CONTAINER_NAME" \
        -d "$IMAGE_NAME"
}

verify_container() {
    echo "[7] Verificando contenedor..."

    sleep 10

    docker ps | grep "$CONTAINER_NAME" && \
    echo "SQL Server ejecutandose correctamente."
}

show_connection_info() {
    echo
    echo "======================================="
    echo "SQL SERVER INSTALADO"
    echo "======================================="
    echo "Servidor : localhost"
    echo "Puerto    : 1433"
    echo "Usuario   : sa"
    echo "Password  : ${SA_PASSWORD}"
    echo
    echo "Conexion JDBC:"
    echo "jdbc:sqlserver://localhost:1433;encrypt=true;trustServerCertificate=true"
    echo
}

main() {
    check_root
    update_system
    install_docker
    start_docker
    download_sqlserver_image
    remove_old_container
    create_sqlserver_container
    verify_container
    show_connection_info
}

main
