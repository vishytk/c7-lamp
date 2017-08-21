FROM vishy/c7-systemd
MAINTAINER "Vishwanath T K" <vishwanath.tk@gmail.com>
# Setup the repos
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
RUN yum-config-manager --enable remi-php71
# Install required packages
RUN yum -y install net-tools
RUN yum -y install openssh-server openssh-clients; systemctl enable sshd.service
RUN echo 'root:centos' |chpasswd
RUN yum -y install httpd; systemctl enable httpd.service
RUN yum -y install mysql-community-server mysql-community-client; systemctl enable mysqld.service
RUN yum -y install php php-mysql php-xml php-mbstring phpMyAdmin
RUN yum clean all
EXPOSE 22 80 443 3306
CMD ["/usr/sbin/init"]
