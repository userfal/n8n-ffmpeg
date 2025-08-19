# استفاده از Ubuntu به عنوان base image
FROM ubuntu:22.04

# نصب ابزارهای مورد نیاز
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    git \
    nodejs \
    npm \
    && apt-get clean

# نصب n8n
RUN npm install -g n8n

# دایرکتوری کاری
WORKDIR /data

# اجرای n8n
CMD ["n8n", "start", "--tunnel"]
