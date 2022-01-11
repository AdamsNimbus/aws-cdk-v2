.SILENT:
CDK_VERSION = 2.3.0
IMAGE_NAME ?= cdk_v2_local:$(CDK_VERSION)

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker run --rm --entrypoint="cdk" $(IMAGE_NAME) --version

.PHONY: shell
shell:
	docker run --rm -it --entrypoint="bash" $(IMAGE_NAME)
