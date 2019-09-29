# compass image
# runs compass within a container
FROM ruby:2.4-alpine3.9


ENV HOME /root


# install compass
RUN gem install --no-rdoc --no-ri compass
RUN gem install --no-rdoc --no-ri compass-normalize
RUN gem install --no-rdoc --no-ri companimation
RUN gem install --no-rdoc --no-ri rgbapng

WORKDIR /srv

ENTRYPOINT ["compass"]
