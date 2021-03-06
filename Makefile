APP_NAME=trebot
ENV_FILE=config.env

build:
	docker build -t ${APP_NAME} .

run:
	docker run --rm --env-file=./$(ENV_FILE) --name="$(APP_NAME)" $(APP_NAME)

stop:
	docker stop $(APP_NAME); docker rm $(APP_NAME)

