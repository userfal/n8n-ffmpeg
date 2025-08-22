# استفاده از یک ایمیج رسمی Node.js سبک
FROM node:20-bullseye-slim

# نصب ffmpeg و ابزارهای مورد نیاز
RUN apt-get update && \
    apt-get install -y ffmpeg git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# نصب n8n به صورت گلوبال
RUN npm install -g n8n

# دایرکتوری کاری داخل کانتینر
WORKDIR /home/node

# تنظیم متغیر محیطی n8n
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# در صورت نیاز می‌توان workflow ها و credentials را اینجا کپی کرد
# COPY ./workflows /home/node/.n8n/workflows
# COPY ./credentials /home/node/.n8n/credentials
# --- نصب Python و pip ---
RUN apt-get update && apt-get install -y python3 python3-pip

# --- نصب کتابخانه‌های مورد نیاز Python ---
RUN pip3 install numpy opencv-python requests
# اجرای n8n هنگام شروع کانتینر
CMD ["n8n", "start"]
