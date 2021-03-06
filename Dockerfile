FROM armv7/armhf-ubuntu:16.04

# gpg keys listed at https://github.com/nodejs/node#release-team
#RUN set -ex \
#  && for key in \
#    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
#    FD3A5288F042B6850C66B31F09FE44734EB7990E \
#    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
#    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
#    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
#    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
#    56730D5401028683275BD23C23EFEFE93C4CFFFE \
#    77984A986EBC2AA786BC0F66B01FBB92821C587A \
#    8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
#  ; do \
#    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
#    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
#    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
#  done


# chromium install 
RUN apt-get update && apt-get install -yq chromium-browser

RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# Add user so we don't need --no-sandbox.
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
    && mkdir -p /home/chrome/Downloads \
    && chown -R chrome:chrome /home/chrome

# Run everything after as non-privileged user.
USER chrome
WORKDIR /home/chrome


# Expose port 9222
EXPOSE 9222

# Autorun chrome headless with no GPU
ENTRYPOINT [ "chromium-browser" ]
CMD [ "--headless", "--disable-gpu", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222" ]