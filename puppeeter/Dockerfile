FROM aemilianmayrhofer/arm7-chrome:latest

RUN apt-get update && apt-get install -y curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install -y nodejs

RUN chown -R chrome:chrome /usr/lib/node_modules

USER chrome

# Set puppeteer env variables
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=TRUE

RUN npm install -g puppeteer

CMD ["node"]