image:
	docker build -t $DOCKER_REPO --build-arg NAME=${NAME} .

tag:
	docker tag $DOCKER_REPO $DOCKER_USERNAME/$DOCKER_REPO:$APP_VERSION

