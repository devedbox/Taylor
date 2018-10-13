// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Taylor",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "TaylorFramework",
      targets: ["TaylorFramework"]),
    .executable(
      name: "taylor",
      targets: ["taylor"])
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/devedbox/Commander.git", "0.3.0"..<"1000.0.0"),
    .package(url: "https://github.com/JohnSundell/Files.git", "2.2.1"..<"1000.0.0"),
    .package(url: "https://github.com/devedbox/Shellman.git", "0.1.1"..<"1000.0.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "TaylorFramework",
      dependencies: ["Files", "Shellman"]),
    .target(
      name: "taylor",
      dependencies: ["TaylorFramework", "Commander"]),
    .testTarget(
      name: "TaylorTests",
      dependencies: ["TaylorFramework"]),
    ]
)
