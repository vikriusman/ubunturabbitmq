FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install rabbitmq-server -y
RUN service rabbitmq-server start && \
    rabbitmq-plugins enable rabbitmq_management && \
    rabbitmqctl start_app && \
    rabbitmqctl add_user test1 test1 && \
    rabbitmqctl set_user_tags test1 administrator && \
    rabbitmqctl set_permissions -p / test1 ".*" ".*" ".*" && \
    service rabbitmq-server stop

EXPOSE 4369 5671 5672 15672 25672
CMD ["rabbitmq-server"]
