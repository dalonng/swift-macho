// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let argumentParserDependency: Target.Dependency = .product(name: "ArgumentParser", package: "swift-argument-parser")

let package = Package(
  name: "macho",
  platforms: [
    .macOS(.v13)
  ],
  products: [
    .library(name: "MachOKit", targets: ["MachOKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.2"),
    .package(url: "git@github.com:kylef/PathKit.git", from: "1.0.1"),
  ],
  targets: [
    .target(
      name: "MachOKit",
      dependencies: [
        "PathKit"
      ]
    ),
    .testTarget(
      name: "machoTests",
      dependencies: ["MachOKit"],
      resources: [
        // .copy("Tests/bin")
      ]
    ),
  ]
)
