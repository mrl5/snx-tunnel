VPN_HOST=""
VPN_USER=""

build:
	docker build \
		-t putvpn:latest \
		-t putvpn:`date -u -Idate` \
		.

check_deps:
	docker -v > /dev/null
	lsmod | grep tun > /dev/null

run: check_deps
	docker run -it \
		--cap-add=NET_ADMIN \
		--device /dev/net/tun:/dev/net/tun \
		--mount type=bind,source=/lib/modules,target=/lib/modules \
		--env vpn_host=$$VPN_HOST \
		--env vpn_user=$$VPN_USER \
		putvpn:latest
