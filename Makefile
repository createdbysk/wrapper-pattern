clean:
	-docker rmi satvidh/wrapper-pattern

build:
	docker build -t satvidh/wrapper-pattern package

test:
	docker run --rm satvidh/wrapper-pattern

ci: clean build test

.PHONY: test
