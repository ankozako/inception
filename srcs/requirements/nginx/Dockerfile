FROM debian:bookworm
RUN apt-get update && apt-get install -y  --no-install-recommends nginx openssl && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=BE/ST=Flanders/L=Gent/O=42/CN=ankozako.42.fr"
COPY conf/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
