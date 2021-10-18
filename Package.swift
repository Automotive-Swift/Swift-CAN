// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-CAN",
    products: [
        .library(
            name: "Swift-CAN",
            targets: ["Swift-CAN"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Swift-CAN",
            dependencies: []
        ),
        .testTarget(
            name: "Swift-CANTests",
            dependencies: ["Swift-CAN"]),
    ]
)
