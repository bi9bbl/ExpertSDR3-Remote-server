FROM ubuntu:24.04

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \
    openssl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/ca-certificates/

RUN echo -n | openssl s_client -connect cloud.eesdr.com:5450 -servername cloud.eesdr.com \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    > /usr/local/share/ca-certificates/eesdr_cert.crt && \
    update-ca-certificates

EXPOSE 8080

CMD ["bash","starter","-cloud","cloud.eesdr.com:5450","-relay","cloud.eesdr.com:5454","-http","8080"]
