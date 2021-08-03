FROM grafana/grafana:latest

COPY files/dashboards/* /etc/grafana/provisioning/dashboards/
COPY files/datasources/* /etc/grafana/provisioning/datasources/
COPY files/plugins/* /etc/grafana/provisioning/plugins/
COPY files/scripts/* /usr/share/grafana/scripts/

RUN unzip '/etc/grafana/provisioning/plugins/fetzerch-sunandmoon-datasource-0.2.1.zip' -d '/var/lib/grafana/plugins/

USER root

RUN apk update; apk add curl jq

RUN chmod +x /usr/share/grafana/scripts/dashboard.sh
RUN mv /run.sh /run_grafana.sh

RUN echo "#!/bin/bash -e" > /run.sh;echo "/usr/share/grafana/scripts/dashboard.sh &" >> /run.sh;chmod +x /run.sh; echo "/run_grafana.sh" >> /run.sh

USER grafana
