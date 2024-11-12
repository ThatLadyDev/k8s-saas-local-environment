setup-services:
	sh scripts/setup.sh

start:
	docker compose up -d

stop:
	docker compose stop