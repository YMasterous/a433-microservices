# Menggunakan image Node.js versi 14 dari Alpine Linux sebagai base image yang berasal dari Docker Hub
FROM node:14-alpine as builder
# Membuat dan menetapkan direktori kerja di dalam container sebagai /app
WORKDIR /app
# Menyalin semua file yang berawalan package dan berakhiran .json ke direktori /app
COPY package*.json ./
# Menjalankan perintah npm install
RUN npm install
# Menyalin semua file dari direktori saat ini (host) ke dalam direktori /app (container)
COPY . .
# Mengekspos port 3000 agar dapat diakses dari luar container
EXPOSE 3000
# Menjalankan perintah npm start
CMD ["npm", "start"]