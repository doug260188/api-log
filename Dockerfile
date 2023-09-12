FROM bitnami/laravel

RUN apt install -y wget

WORKDIR /var/www

RUN rm -rf api
RUN wget https://github.com/doug260188/api-log/blob/main/api.rar
RUN tar -zxvf api.rar

WORKDIR /var/www/api

COPY . .
COPY .env.example .env

ARG DB_CONNECTION=mysql
ARG DB_HOST=172.17.17.117
ARG DB_PORT=3306
ARG DB_DATABASE=sistema-mulher
ARG DB_USERNAME=root
ARG DB_PASSWORD=fp0ky2x
ARG FILESYSTEM_DISK=public

ARG SANCTUM_STATEFUL_DOMAINS=172.17.17.117:8098
ARG SESSION_DOMAIN=172.17.17.117

### SANCTUM_STATEFUL_DOMAINS = endereço do frontend e porta se houver.
### SESSION_DOMAIN = endereço do servidor do front que fará acesso a api.

ENV DB_HOST="${DB_HOST}"
ENV DB_PORT="${DB_PORT}"
ENV DB_USERNAME="${DB_USERNAME}"
ENV DB_PASSWORD="${DB_PASSWORD}"
ENV DB_DATABASE="${DB_DATABASE}"
ENV DB_CONNECTION="${DB_CONNECTION}"
ENV SESSION_DOMAIN="${SESSION_DOMAIN}"
ENV SANCTUM_STATEFUL_DOMAINS="${SANCTUM_STATEFUL_DOMAINS}"
ENV FILESYSTEM_DISK="${FILESYSTEM_DISK}"

RUN sed -i "s/^DB_HOST.*/DB_HOST=${DB_HOST}/g" .env && \
	sed -i "s/^DB_PORT.*/DB_PORT=${DB_PORT}/g" .env && \
	sed -i "s/^DB_USERNAME.*/DB_USERNAME=${DB_USERNAME}/g" .env && \
	sed -i "s/^DB_PASSWORD.*/DB_PASSWORD=${DB_PASSWORD}/g" .env && \
	sed -i "s/^DB_CONNECTION.*/DB_CONNECTION=${DB_CONNECTION}/g" .env && \
	sed -i "s/^DB_DATABASE.*/DB_DATABASE=${DB_DATABASE}/g" .env && \
	sed -i "s/^APP_URL.*/#APP_URL=/g" .env && \
	sed -i "s/^SESSION_DOMAIN.*/SESSION_DOMAIN=${SESSION_DOMAIN}/g" .env && \
	sed -i "s/^SANCTUM_STATEFUL_DOMAINS.*/SANCTUM_STATEFUL_DOMAINS=${SANCTUM_STATEFUL_DOMAINS}/g" .env && \
	sed -i "s/^FILESYSTEM_DISK.*/FILESYSTEM_DISK=${FILESYSTEM_DISK}/g" .env && \
    sed -i "s/^RECOVER_PASSWORD.*/RECOVER_PASSWORD=\"http:\/\/desempenho-app.argointeligencia.com.br\/forget\/\"/g" .env

RUN echo DB_FOREIGN_KEYS=true >> .env
RUN echo APP_URL=http://172.17.17.117:8098 >> .env

### RUN echo 'APP_NAME=DESEMPENHO' >> .env
### APP_URL = endereço do backend.

RUN composer update && composer install --ignore-platform-reqs && php artisan migrate && php artisan key:generate && php artisan storage:link && chmod  777 storage/ -R

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
