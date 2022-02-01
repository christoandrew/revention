FROM ruby:2.7.2
ENV RAILS_ENV=development
RUN apt-get update -qq
WORKDIR /opt/revention
COPY Gemfile /opt/revention/Gemfile
COPY Gemfile.lock /opt/revention/Gemfile.lock
RUN bundle install
COPY . .

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
