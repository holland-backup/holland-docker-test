From centos:7

RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y wget git python3-setuptools gcc python3-devel python3-configobj python3-mock python36-mysql
RUN yum install -y mariadb-server mariadb-devel
RUN git clone https://github.com/datacharmer/test_db.git
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
