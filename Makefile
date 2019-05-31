build:
	docker build -t jasonmccallister/go-echo:local .
run: build
	docker run -i -t --rm -e LISTEN_PORT=5001 jasonmccallister/go-echo:local
