FROM grafana/grafana:latest

COPY files/dashboards/* /etc/grafana/provisioning/dashboards/
COPY files/datasources/* /etc/grafana/provisioning/datasources/
COPY files/plugins/* /etc/grafana/provisioning/plugins/
COPY files/scripts/* /usr/share/grafana/scripts/

USER root

RUN apk update; apk add curl jq

RUN chmod +x /usr/share/grafana/scripts/dashboard.sh
USER grafana

#RUN /usr/share/grafana/scripts/dashboard.sh
