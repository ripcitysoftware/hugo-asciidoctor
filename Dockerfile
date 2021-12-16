FROM asciidoctor/docker-asciidoctor:latest
MAINTAINER chris.maki@ripcitysoftware.com

# Create working directory
RUN mkdir /usr/share/blog
WORKDIR /usr/share/blog

RUN apk update && \
	apk add --no-cache \
	ca-certificates \
    libc6-compat \
    libstdc++ 


# Download and install hugo
ENV HUGO_VERSION 0.90.1
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN curl -fsSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} -o /tmp/hugo.tar.gz && \
	tar -xvzf /tmp/hugo.tar.gz -C /tmp/ && \
	mv /tmp/hugo /usr/bin/hugo && \
	rm -rf /tmp/hugo*

# Expose default hugo port
EXPOSE 1313
