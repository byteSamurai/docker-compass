# compass image
# runs compass within a container
FROM alpine:3.9 as pre-builder
RUN apk update \
    && apk add --virtual build-dependencies \
        build-base \
        gcc \
        wget \
        git
RUN apk add --no-cache ruby ruby-dev





# install compass
RUN gem install --no-rdoc --no-ri compass
RUN gem install --no-rdoc --no-ri compass-normalize
RUN gem install --no-rdoc --no-ri companimation
RUN gem install --no-rdoc --no-ri compass-rgbapng


FROM alpine:3.9
RUN apk add --no-cache ruby
COPY --from=pre-builder /usr/lib/ruby/ /usr/lib/ruby/
COPY --from=pre-builder /root/.gem /root/.gem
COPY --from=pre-builder /usr/bin/compass /usr/bin/compass

ENV HOME /root
WORKDIR /srv

ENTRYPOINT ["compass"]
