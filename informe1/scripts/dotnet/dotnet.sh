#!/bin/bash

set -e

echo "[1/5] Instalando dependencias..."
sudo apt update
sudo apt install -y wget gpg apt-transport-https ca-certificates

echo "[2/5] Detectando version de Debian..."
DEBIAN_VERSION=$(grep VERSION_ID /etc/os-release | cut -d '"' -f2)

echo "Debian detectado: $DEBIAN_VERSION"

echo "[3/5] Agregando repositorio oficial de Microsoft..."
wget https://packages.microsoft.com/config/debian/$DEBIAN_VERSION/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

echo "[4/5] Actualizando repositorios..."
sudo apt update

echo "[5/5] Instalando .NET SDK 10..."
sudo apt install -y dotnet-sdk-10.0

echo
echo "Instalacion completada."
dotnet --version