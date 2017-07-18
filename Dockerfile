FROM ruby:latest

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt update -y && apt upgrade -y
RUN apt install -y --no-install-recommends chromium icedove ruby ruby-safe-yaml xvfb x11vnc 

RUN Xvfb :99 &
ENV DISPLAY=:99

RUN ln -s `which icedove` /usr/bin/firefox
RUN ln -s `which chromium` /usr/bin/chrome

ADD . /root/tst

WORKDIR /root/tst
ENV PATH "/root/tst/bin/linux/x86_64:${PATH}"
RUN gem install bundler
RUN bundle install

RUN which chrome
RUN chrome -h
ENTRYPOINT ["ruby"]
CMD ["main.rb"]
