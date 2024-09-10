
FROM node:16-alpine AS build
# Create a Virtual directory inside the docker image
WORKDIR /dist/src/app

COPY ./Front_end /Front_end
#RUN cd /Front_end/ && npm cache clean --force


RUN cd /Front_end/ && npm config set strict-ssl=false && npm cache clean --force --no-check-certificate && npm install --force --no-check-certificate && npm run build --prod --no-check-certificate
#RUN npm run build --prod


FROM nginx:alpine-slim AS ngi
RUN apk add --update --no-check-certificate nodejs npm
COPY --from=build /Front_end/dist/Front_end /usr/share/nginx/html
COPY /Front_end/nginx.conf  /etc/nginx/nginx.conf
RUN chmod -R 755 /usr/share/nginx/html

WORKDIR /Back_end/
COPY ./start_script.sh /bin/start_script.sh
COPY ./Back-end /Back_end

RUN cd /Back_end/ && npm config set strict-ssl=false && npm install --no-check-certificate

EXPOSE 8001
CMD ["/bin/start_script.sh"]