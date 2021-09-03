// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RPNCalculator",
    products: [
        .executable(name: "rpn", targets: ["RPNCalculator"])
    ],
    dependencies: [
        .package(
          name: "swift-argument-parser",
          url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.4.0")
        ),
    ],
    targets: [
        .target(
            name: "RPNCalculator",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "RPNCalculatorTests",
            dependencies: ["RPNCalculator"]),
    ]
)
