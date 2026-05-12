#!/bin/bash

set -e

PACKAGE_NAME="dbeaver-ce"

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

install_dependencies() {
    echo "[2] Instalando dependencias..."
    apt install snapd -y
}

enable_snap_services() {
    echo "[3] Habilitando snapd..."
    systemctl enable --now snapd.socket
    systemctl enable --now snapd
}

wait_snap() {
    echo "[4] Esperando inicializacion de snap..."
    sleep 10
}

install_dbeaver() {
    echo "[5] Instalando DBeaver..."

    if snap list | grep -q "^${PACKAGE_NAME}$"; then
        echo "DBeaver ya esta instalado."
        return
    fi

    snap install "$PACKAGE_NAME"
}

verify_installation() {
    echo "[6] Verificando instalacion..."

    if snap list | grep -q "^${PACKAGE_NAME}$"; then
        echo "DBeaver instalado correctamente."
    else
        echo "Error instalando DBeaver."
        exit 1
    fi
}

show_final_info() {
    echo
    echo "======================================="
    echo "DBEAVER INSTALADO"
    echo "======================================="
    echo "Ejecutar con:"
    echo "dbeaver"
    echo
    echo "Conexion SQL Server:"
    echo "Host      : localhost"
    echo "Puerto    : 1433"
    echo "Usuario   : sa"
    echo "Encrypt   : true"
    echo "TrustServerCertificate : true"
    echo "======================================="
}

main() {
    check_root
    update_system
    install_dependencies
    enable_snap_services
    wait_snap
    install_dbeaver
    verify_installation
    show_final_info
}

main