setup-services:
	sh scripts/setup.sh

build:
	docker compose up -d --build

start:
	docker compose up -d

stop:
	docker compose stop