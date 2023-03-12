# make

build:
	swift build

update:
	swift package update

release:
	swift build -c release

format:
	swift-format format --in-place --recursive "${PWD}/Sources/"
	swift-format format --in-place --recursive "${PWD}/Tests/"
	swift-format format --in-place Package.swift


test:
	swift test --parallel

clean:
	rm -rf build
