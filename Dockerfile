FROM ubuntu:22.04

RUN apt-get update && apt-get install -y ffmpeg

# Base image n8n
FROM n8nio/n8n:latest

# نصب ffmpeg
USER root
RUN apt-get update && apt-get install -y ffmpeg

# برگشت به کاربر n8n
USER node

# پورتی که n8n استفاده می‌کنه
EXPOSE 5678

# دستور start n8n
CMD ["n8n"]
