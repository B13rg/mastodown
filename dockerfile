FROM python:alpine

RUN which crond && \
    rm -rf /etc/periodic

RUN pip install --no-cache-dir mastodon-archive

WORKDIR /data

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY crontab /etc/crontab

ENTRYPOINT ["/entrypoint.sh"]

# source: `docker run --rm -it alpine  crond -h`
# -f | Foreground
# -l N | Set log level. Most verbose 0, default 8
CMD ["crond", "-f", "-l", "2"]