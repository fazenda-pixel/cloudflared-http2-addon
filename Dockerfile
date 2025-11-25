# Используем базовый образ Home Assistant
ARG BUILD_FROM
FROM $BUILD_FROM

# Устанавливаем cloudflared
RUN apk add --no-cache curl \
    && curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/bin/cloudflared \
    && chmod +x /usr/bin/cloudflared

# Создаём сервисную директорию для s6-overlay
RUN mkdir -p /etc/services.d/cloudflared

# Копируем скрипт запуска в нужное место
COPY run.sh /etc/services.d/cloudflared/run
RUN chmod +x /etc/services.d/cloudflared/run

# Не указываем CMD — базовый образ сам запускает /init
