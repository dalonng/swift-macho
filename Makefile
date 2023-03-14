# make

xcodeproj:
	swift package generate-xcodeproj

build:
	swift build

update:
	swift package update

run: build
	./.build/debug/macho

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
