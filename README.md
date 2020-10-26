# SNX VPN tunnel

## Use case

SNX VPN client requires 32bit libs that are not present on my host OS
(Funtoo Linux for 64-bit CPUs [since version 1.3](https://www.funtoo.org/Release_Notes/1.3-release) is 64-bit only).


## The goal

To set up SNX VPN on guest and use it on host.

This can be approached in multiple ways:
1. [32bit chroot](https://www.funtoo.org/32-bit_Chroot)
2. [Docker] image
3. [firecracker] microVM


## Table of contents
* [Docker image](#docker-image)
* [References](#references)


## Docker image


### Requirements

- [Docker]
- [TUN Linux module](https://www.kernel.org/doc/Documentation/networking/tuntap.txt)


### Getting started

```
# build image
make build

# load tun kernel module
sudo modprobe tun

# start VPN tunnel
make VPN_HOST=... VPN_USER=... run
```


## References

1. [PUT VPN manual (pl_PL)](https://instrukcje.put.poznan.pl/konfiguracja-vpn-ubuntu-18-04/)
2. [Gentoo WIKI page on SSL Network Extender](https://wiki.gentoo.org/wiki/SSL_Network_Extender)
3. [Docker development best practices](https://docs.docker.com/develop/dev-best-practices/)
4. [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)



[Docker]: https://www.docker.com/
[firecracker]: https://github.com/firecracker-microvm/firecracker
