# Dùng Node.js trên nền Debian Bullseye Slim để có apt package Pandoc đầy đủ
FROM node:20-bullseye-slim

# Cài đặt Pandoc, librsvg (để render SVG sang hình Word nếu có), và font chữ cơ bản
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    librsvg2-bin \
    fonts-dejavu \
    fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

ENV PORT=8080
ENV NODE_ENV=production

EXPOSE 8080

CMD ["node", "server.js"]
