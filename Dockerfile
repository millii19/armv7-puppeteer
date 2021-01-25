FROM alpine


RUN apk --no-cache add chromium

# Add user so we don't need --no-sandbox.
RUN addgroup -S chrome && adduser -S chrome -G chrome \
    && mkdir -p /home/chrome/Downloads \
    && chown -R chrome:chrome /home/chrome

# Run everything after as non-privileged user.
USER chrome
WORKDIR /home/chrome


# Expose port 9222
EXPOSE 9222

# Autorun chrome headless with no GPU
CMD [ "chromium-browser", "--headless", "--disable-gpu", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222" ]