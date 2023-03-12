// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "macho",
  products: [
    .library(
      name: "macho",
      targets: ["macho"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "macho",
      dependencies: []),
    .testTarget(
      name: "machoTests",
      dependencies: ["macho"],
      resources: [
        .copy("Tests/bin")
      ]),
  ]
)
