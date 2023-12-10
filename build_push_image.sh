#!/bin/bash

# Langkah 1: Menjalankan build image
echo "Langkah 1: Membuat image..."
docker build -t item-app:v1 .

# Langkah 2: Menampilkan daftar image yang tersedia
echo "Langkah 2: Daftar image yang tersedia"
docker images

# Langkah 3: Menyiapkan image untuk di-push ke GitHub Packages
echo "Langkah 3: Menyertakan tag pada image untuk GitHub Packages"
docker tag item-app:v1 ghcr.io/ymasterous/item-app:v1

# Langkah 4: Menunggu input PAT (Personal Access Token)
echo "Langkah 4: Masukkan PAT (Personal Access Token): "
read -s CR_PAT

# Langkah 5: Melakukan login ke GitHub Packages
echo "Langkah 5: Melakukan login ke GitHub Packages"
echo $CR_PAT | docker login ghcr.io -u YMasterous --password-stdin

# Langkah 6: Melakukan push image ke GitHub Packages
echo "Langkah 6: Melakukan push image ke GitHub Packages"
docker push ghcr.io/ymasterous/item-app:v1

# Langkah 7: Menampilkan pesan selesai
echo "Langkah 7: Selesai"
