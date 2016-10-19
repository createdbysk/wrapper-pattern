test:
	echo "No tests to run. So Sad :-("

clean:
	echo "clean"

build:
	echo "build"

publish:
	echo "publish"

ci: clean test build publish

.PHONY: test
	
