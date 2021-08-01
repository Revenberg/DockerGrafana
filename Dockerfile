FROM grafana/grafana:latest

COPY files/dashboards/* /etc/grafana/provisioning/dashboards/
COPY files/datasources/* /etc/grafana/provisioning/datasources/
COPY files/plugins/* /etc/grafana/provisioning/plugins/
COPY files/scripts/* /home/grafana

USER root

RUN apt-get update; apt-get install curl

RUN chmod +x /home/grafana/update-dashboards.sh
USER grafana

RUN /home/grafana/update-dashboards.sh
