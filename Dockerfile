FROM jjmerelo/raku-test:latest
LABEL version="2.0.0" maintainer="JJ Merelo <jjmerelo@GMail.com>"

# Add openssl
USER root
RUN apk update && apk upgrade \
    && apk add --no-cache openssl-dev

USER raku
RUN zef install OpenSSL

# Will run this
ENTRYPOINT raku -v && zef install --deps-only . && zef test .

# Repeating mother's env
ENV PATH="/home/raku/.rakudobrew/bin:${PATH}"

