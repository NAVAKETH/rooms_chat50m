reload:
	docker bulid -t listchat .
	docker-compose down
	docker-compose up -d
