FROM rockylinux:8

# Enable PowerTools and EPEL
RUN dnf install -y dnf-plugins-core epel-release && \
    dnf config-manager --set-enabled powertools && \
    dnf clean all

# Fix libcurl conflict - remove minimal and install full
#RUN  dnf install -y libcurl 

# Install build dependencies
RUN dnf -y install \
    git make gcc gcc-c++ bison flex \
    openssl-devel libxml2-devel libevent-devel \
    libcurl-devel systemd-devel python3-devel \
    json-c-devel jansson-devel lua-devel  

RUN dnf -y install rsyslog net-tools git which gdb traceroute nmap wireshark bison flex libevent make gcc json-c json-c-devel openssl-devel openssl libxml2-devel libxml2 libevent libevent-devel systemd-devel gcc-c++ flex-devel logrotate jansson-devel jansson lua-devel lua
RUN dnf -y install logrotate crontabs    
RUN dnf -y install mariadb-connector-c-devel mariadb-connector-c
# Install runtime dependencies
RUN dnf -y install \
    rsyslog net-tools procps-ng \
    && dnf clean all

# Create output directory
RUN mkdir -p /kamailio

WORKDIR /build

COPY build.sh /build/

RUN chmod +x /build/build.sh && /build/build.sh

# Verify installation
RUN ls -la /kamailio && \
    test -f /kamailio/sbin/kamailio || (echo "Kamailio binary not found!" && exit 1)
