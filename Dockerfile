FROM nginx

RUN apt-get update; \
    apt-get install -y curl unzip watch cron; \
    curl https://rclone.org/install.sh | bash

RUN mkdir /opt/app
WORKDIR /opt/app
COPY rclone.conf .
COPY sync.sh .
RUN chmod +x sync.sh

CMD ["/opt/app/sync.sh"]
