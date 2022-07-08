reload:
	docker-compose down
	docker-compose up -d

build:
	docker build -t repo.korkla.in/mon-listchat .
	docker push repo.korkla.in/mon-listchat

pull:
	docker pull repo.korkla.in/mon-listchat