FROM debian:bookworm
RUN apt-get update && apt-get install -y  --no-install-recommends mariadb-server && rm -rf /var/lib/apt/lists/* /var/lib/mysql/*
COPY conf/md.cnf /etc/mysql/mariadb.conf.d/51-bind.cnf
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["/usr/local/bin/setup.sh"]
