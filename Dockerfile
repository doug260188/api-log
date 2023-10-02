FROM node:16.14.2 as build-stage

WORKDIR /app

docker cp /caminho/do/arquivo/ou/diretório/do/host container_id:/caminho/para/o/diretório/no/container

COPY . .

RUN touch .env

RUN echo "API_URL=http://201.71.149.227:9098" > .env 

#RUN echo 'APP_NAME=DESEMPENHO' >> .env

RUN yarn global add @quasar/cli

RUN yarn install

RUN npm install

RUN quasar build

FROM ubuntu/apache2:latest as production-stage

RUN sed -i -e "10s/^/FallbackResource \/index.html/" /etc/apache2/sites-enabled/000-default.conf

COPY --from=build-stage app/dist/spa /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
