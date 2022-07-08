reload:
	docker build -t listchat .
	docker-compose down
	docker-compose up -d
