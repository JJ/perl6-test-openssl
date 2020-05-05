FROM jjmerelo/raku-test:latest
LABEL version="1.0.2" maintainer="JJ Merelo <jjmerelo@GMail.com>"

# Add openssl
RUN apk update && apk upgrade \
    && apk add --no-cache openssl-dev \
    && zef install OpenSSL

# Will run this
ENTRYPOINT raku -v && zef install --deps-only . && zef test .

# Repeating mother's env
ENV PATH="/root/.rakudobrew/bin:${PATH}"

