FROM i386/debian

RUN apt-get update && \
    apt-get -y install \
        libstdc++5:i386 \
        libx11-6:i386 \
        kmod \
        bzip2 \
        wget

RUN mkdir /tmp/snx_install && cd "$_" && \
    wget --no-check-certificate \
        -c https://hellfire.put.poznan.pl/CSHELL/snx_install.sh \
        -O snx_install.sh && \
    sh snx_install.sh && rm snx_install.sh

ENV vpn_host="" \
    vpn_user=""

CMD modprobe tun && \
    /usr/bin/snx -s "$vpn_host" -u "$vpn_user" && \
    /bin/bash
