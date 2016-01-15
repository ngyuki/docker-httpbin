FROM centos:7

RUN yum -y install epel-release &&\
    yum -y install python-pip &&\
    yum -y install openssl &&\
    yum clean all

RUN pip install httpbin

RUN pip install gunicorn

COPY boot.sh /root/boot.sh

CMD bash /root/boot.sh
