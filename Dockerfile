FROM debian:stable-slim

RUN apt-get update && apt-get upgrade -y

COPY test.sh /test.sh
RUN chmod +x /test.sh

CMD "/test.sh"
