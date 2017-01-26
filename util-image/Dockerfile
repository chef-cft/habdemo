FROM fedora:latest

MAINTAINER The Habitat Maintainers <humans@habitat.sh>

RUN dnf -y install jq less wget tar git

RUN cd /tmp && wget -O /tmp/hab-%24latest-x86_64-linux.tar.gz https://api.bintray.com/content/habitat/stable/linux/x86_64/hab-%24latest-x86_64-linux.tar.gz?bt_package=hab-x86_64-linux && tar zxvf hab-%24latest-x86_64-linux.tar.gz && install -m 755 hab-0.*/hab /bin && rm -rf hab-%24latest-x86_64-linux.tar.gz hab-0.*

RUN git clone https://github.com/chef-cft/habdemo

CMD ["bash", "-l"]
