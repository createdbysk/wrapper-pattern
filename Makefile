clean:
	-./clean.sh

build:
	./build.sh

test:
	./test.sh

publish:
	./publish.sh

ci: clean build test publish

.PHONY: test
