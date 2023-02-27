FROM debian:stable-slim

COPY test.sh /test.sh
RUN chmod +x /test.sh

CMD "/test.sh"
