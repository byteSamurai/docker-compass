# compass image
# runs compass within a container
FROM ubuntu:14.04
MAINTAINER François Zaninotto <francois+docker@marmelab.com>

ENV HOME /root

RUN apt-get update -qq

# install ruby
RUN apt-get install -y -qq ruby-dev
RUN apt-get install make

# install compass
RUN gem install --no-rdoc --no-ri compass
RUN gem install --no-rdoc --no-ri compass-normalize
RUN gem install --no-rdoc --no-ri companimation
RUN gem install --no-rdoc --no-ri rgbapng

WORKDIR /srv

ENTRYPOINT ["compass"]
