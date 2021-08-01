FROM grafana/grafana:latest

COPY files/dashboards/* /etc/grafana/provisioning/dashboards/
COPY files/datasources/* /etc/grafana/provisioning/datasources/
COPY files/plugins/* /etc/grafana/provisioning/plugins/
COPY files/scripts/* /home/grafana

RUN chmod +x /home/grafana/update-dashboards.sh
RUN /home/grafana/update-dashboards.sh
