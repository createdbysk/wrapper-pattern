test:
	echo "No tests to run. So Sad :-("

clean:
	echo "clean"

build:
	docker build -t satvidh/wrapper-pattern .

publish:
	echo "publish"

ci: clean test build publish

.PHONY: test
