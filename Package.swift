// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTelegramApi",
    products: [
        .library(name: "SwiftTelegramApi", targets: ["SwiftTelegramApi"]),
        .executable(name: "TelegramAPIGenerator", targets: ["TelegramAPIGenerator"])
    ],
    targets: [
        .target(
            name: "SwiftTelegramApi"
        ),
        .executableTarget(
            name: "TelegramAPIGenerator"
        )
    ]
)
