// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TelegramAPI",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "TelegramAPI", targets: ["TelegramAPI"]),
        .executable(name: "TelegramAPIGenerator", targets: ["TelegramAPIGenerator"])
    ],
    targets: [
        .target(
            name: "TelegramAPI",
            dependencies: []),
        .target(
            name: "TelegramAPIGenerator",
            dependencies: []
        ),
    ]
)
