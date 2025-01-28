#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
	@echo workspace
	@echo logs
	@echo stats
	@echo clean
	@echo ----------------------

_header:
	@echo ----------
	@echo PostgreSQL
	@echo ----------

_urls: _header
	${info }
	@echo -------------------------------
	@echo [pgAdmin] http://localhost:8090
	@echo -------------------------------

_start-command:
	@docker compose up -d --remove-orphans

start: _header _start-command _urls

stop:
	@docker compose stop

restart: stop start

workspace:
	@docker compose exec postgresql /bin/bash

logs:
	@docker compose logs postgresql

stats:
	@docker stats

clean:
	@docker compose down -t 0 -v --remove-orphans
