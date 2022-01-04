.PHONY: console, install, migrate, setup, migration, bash

console:
	docker-compose run --rm app bundle exec rails console

install:
	docker-compose run --rm app bundle install
	docker-compose run --rm app bundle exec pre-commit install
	git config pre-commit.ruby "docker-compose run --rm app bundle exec ruby"
	git config pre-commit.checks "[rubocop]"
	git config pre-commit.rubocop.flags ["-a"]
	cp .pre-commit.template .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit

migrate:
	docker-compose run --rm app bundle exec rails db:migrate

setup:
	docker-compose run --rm app bundle exec rails db:drop db:create db:migrate db:seed

migration:
	docker-compose run --rm app bundle exec rails g migration ${NAME}

bash:
	docker-compose exec app /bin/bash