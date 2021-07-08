FROM nginx:latest
RUN sed -i 's/nginx/punch/g' /usr/share/nginx/html/index.html
EXPOSE 80
