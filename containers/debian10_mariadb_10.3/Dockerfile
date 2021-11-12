From debian:10

RUN apt-get update
RUN apt-get --yes install git python3-setuptools gcc python3-pip python3-configobj python3-pymysql mariadb-server
ADD ./entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
