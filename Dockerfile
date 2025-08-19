FROM ubuntu:22.04

# نصب ابزارهای پایه
RUN apt-get update && apt-get install -y \
    curl \
    ffmpeg \
    git \
    build-essential \
    && apt-get clean

# نصب Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# نصب n8n
RUN npm install -g n8n

WORKDIR /data

CMD ["n8n", "start", "--tunnel"]
