# make

build:
	swift build

update:
	swift package update

release:
	swift build -c release

# install: release
# 	install	

test:
	swift test --parallel

clean:
	rm -rf build