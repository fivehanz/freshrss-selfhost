MAKEFLAGS += -j2

nginx-init: prod-nginx-link


### PRODUCTION COMMANDS
prod-start:
	docker compose --file ./docker-compose.yml up -d
prod-rebuild:
	docker compose --file ./docker-compose.yml up -d --build
prod-restart:
	docker compose --file ./docker-compose.yml up -d --force-recreate	
prod-stop:
	docker compose --file ./docker-compose.yml down

prod-nginx-link:
	ln -s ${shell pwd}/vhost.conf /etc/nginx/sites-enabled/freshrss.conf
	nginx -s reload
