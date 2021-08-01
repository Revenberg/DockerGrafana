FROM grafana/grafana:latest

COPY files/* //etc/grafana/provisioning/

CMD python ./solarrs485logger.py
