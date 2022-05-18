FROM cassandra:4.0.4

RUN apt-get update && apt-get install -y postgresql

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
