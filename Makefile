clean:
	-docker rmi satvidh/wrapper-pattern

build:
	docker build -t satvidh/wrapper-pattern .

test:
	docker run --rm satvidh/wrapper-pattern

publish:
	echo "publish"

ci: clean build test publish

.PHONY: test
