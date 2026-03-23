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

# Copiar resto do projeto
COPY . .

# Expor porta
EXPOSE 3000

# Rodar servidor
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]