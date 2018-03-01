FROM alpine:edge

#https://pkgs.alpinelinux.org/package/edge/community/x86_64/chromium
RUN apk add --no-cache chromium=64.0.3282.168-r0 dumb-init sudo

RUN mkdir /data \
 && mkdir /data/chrome \
 && mkdir /data/headless \
 && addgroup sudo \
 && adduser headless -s /bin/sh -h /data/headless -D -G sudo  \
 && chown headless:sudo /data/chrome \
 && chown headless:sudo /data/headless \
 && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
 && echo 'headless:nopassword' | chpasswd 

EXPOSE 9222

USER headless

ENTRYPOINT ["/usr/bin/dumb-init", "--", \
            "/usr/bin/chromium-browser", \
            "--disable-gpu", \
            "--headless", \
            "--allow-insecure-localhost", \
            "--disable-background-networking", \
            "--disable-default-apps", \
            "--disable-extensions", \
            "--disable-prompt-on-repost", \
            "--disable-sync", \
            "--disable-translate", \
            "--hide-scrollbars", \
            "--no-sandbox", \
            "--disable-dev-shm-usage", \
            "--remote-debugging-address=0.0.0.0", \
            "--remote-debugging-port=9222", \
            "--user-data-dir=/data/chrome"]