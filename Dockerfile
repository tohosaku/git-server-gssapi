FROM debian:buster-slim

ADD https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-x86_64-linux /root/mitamae
COPY setup.rb conf /root/
RUN chmod +x /root/mitamae; \
    apt-get update; \
    apt-get install -y --no-install-recommends; \
    cd /root && ./mitamae local ./setup.rb; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists;

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
