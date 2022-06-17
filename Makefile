DOCKER_USERNAME=jcorrado76
APP_NAME=simple-express
APP_VERSION=0.0.1
FULL_APP_SPEC=${APP_NAME}:${APP_VERSION}

REVERSE_PROXY_REPO_NAME=simple-reverse-proxy
REVERSE_PROXY_VERSION=0.0.1
FULL_REVERSE_PROXY_SPEC=${REVERSE_PROXY_REPO_NAME}:${REVERSE_PROXY_VERSION}

build_simple_express:
	docker build -t ${DOCKER_USERNAME}/${FULL_APP_SPEC} -f ./simple_express_Dockerfile .

build_reverse_proxy:
	docker build -t ${DOCKER_USERNAME}/${FULL_REVERSE_PROXY_SPEC} -f ./reverse_proxy_Dockerfile .

push_simple_express:
	docker push ${DOCKER_USERNAME}/${FULL_APP_SPEC}

push_reverse_proxy:
	docker push ${DOCKER_USERNAME}/${FULL_REVERSE_PROXY_SPEC}

test_app_directly:
	curl http://my-app-2-svc:8080/health

test_nginx_proxy:
	curl http://reverseproxy-svc:8080/api/health
