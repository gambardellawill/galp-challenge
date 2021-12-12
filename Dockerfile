FROM nginx:alpine
LABEL org.opencontainers.image.authors="william@gambardella.eng.br"

COPY index.html /usr/share/nginx/html

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
