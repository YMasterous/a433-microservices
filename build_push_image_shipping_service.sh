#!/bin/bash

# Langkah 1: Menjalankan perintah untuk build image
echo "Langkah 1: Membuat image..."
docker build -t ghcr.io/ymasterous/shipping-service:latest .

# Langkah 2: Melakukan login ke GitHub Packages
echo "Langkah 2: Melakukan login ke GitHub Packages..."
echo $CR_PAT | docker login ghcr.io -u YMasterous --password-stdin

# Langkah 3: Melakukan push image ke GitHub Packages
echo "Langkah 3: Melakukan push image ke GitHub Packages..."
docker push ghcr.io/ymasterous/shipping-service:latest

# Langkah 4: Menampilkan pesan selesai
echo "Langkah 4: Selesai"