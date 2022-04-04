build:
	docker build -t app-onbuild .
release:
	docker buildx build --push --platform linux/amd64,linux/arm64 -t qzio/app-onbuild:latest .
