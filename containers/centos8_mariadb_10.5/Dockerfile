From centos:8

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y wget git python3-setuptools gcc python3-devel python3-configobj python3-PyMySQL
ADD ./mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN wget -O /tmp/RPM-GPG-KEY-MariaDB https://mirror.jaleco.com/mariadb/yum/RPM-GPG-KEY-MariaDB
RUN rpm --import  /tmp/RPM-GPG-KEY-MariaDB
RUN yum install -y mariadb-server mariadb-backup mariadb-devel
ADD my.cnf /root/.my.cnf
ADD ./entrypoint.sh /entrypoint.sh
RUN echo "plugin-load-add=auth_gssapi.so" > /etc/my.cnf.d/auth_gssapi.cnf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
