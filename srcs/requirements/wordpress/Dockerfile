FROM debian:bookworm
RUN apt-get update && apt-get install -y  --no-install-recommends ca-certificates php8.2-fpm php8.2-curl php8.2-gd php8.2-xml php8.2-mbstring php8.2-mysqli curl mariadb-client && rm -rf /var/lib/apt/lists/*
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["/usr/local/bin/setup.sh"]
