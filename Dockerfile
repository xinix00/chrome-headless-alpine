FROM alpine:edge

#https://pkgs.alpinelinux.org/package/edge/community/x86_64/chromium
RUN apk add --no-cache chromium=64.0.3282.168-r0

EXPOSE 9222

ENTRYPOINT ["chromium-browser"]

CMD [ \
  "--allow-insecure-localhost", \
  "--disable-background-networking", \
  "--disable-default-apps", \
  "--disable-extensions", \
  "--disable-prompt-on-repost", \
  "--disable-sync", \
  "--disable-translate", \
  "--hide-scrollbars", \
  "--metrics-recording-only", \
  "--mute-audio", \
  "--no-first-run", \
  "--no-sandbox", \
  "--safebrowsing-disable-auto-update", \
  "--headless", \
  "--disable-gpu", \
  "--remote-debugging-port=9222" \
]
