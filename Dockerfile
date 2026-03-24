FROM ruby:3.2

# Instalar dependências
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  build-essential \
  libpq-dev

# Diretório da app
WORKDIR /app

# Copiar Gemfile
COPY Gemfile Gemfile.lock ./

# Instalar gems
RUN bundle install

# Instalar Foreman
RUN gem install foreman

# Copiar resto do projeto
COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/dev"]