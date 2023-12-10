# Menggunakan image Node.js versi 14 dari Alpine Linux sebagai base image yang berasal dari Docker Hub
FROM node:14-alpine

# Membuat dan menetapkan direktori kerja di dalam container sebagai /app
WORKDIR /app

# Menyalin semua file dari direktori saat ini (host) ke dalam direktori /app (container)
COPY . .

# Menetapkan environment variable NODE_ENV sebagai production dan DB_HOST sebagai item-db
ENV NODE_ENV=production DB_HOST=item-db

# Menjalankan instalasi dependencies dengan mode production dan flag unsafe-perm, kemudian menjalankan perintah build dari proyek Node.js
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 agar dapat diakses dari luar container
EXPOSE 8080

# Menjalankan server dengan perintah npm start ketika container dijalankan
CMD ["npm", "start"]