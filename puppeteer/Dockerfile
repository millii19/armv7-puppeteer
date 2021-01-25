FROM aemilianmayrhofer/arm7-chrome:latest

USER root
RUN apk add --update --no-cache nodejs npm

RUN chown -R chrome:chrome /usr/lib/node_modules

USER chrome

# Set puppeteer env variables
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=TRUE

RUN npm install -g puppeteer

CMD ["node"]