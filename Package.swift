// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let useLocalDependency = false

let local: [Package.Dependency] = [
    .package(path: "../ChatModels"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
]

let remote: [Package.Dependency] = [
    .package(url: "https://pubgi.sandpod.ir/chat/ios/chat-models", from: "2.2.1"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
]

let package = Package(
    name: "ChatDTO",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13),
        .macCatalyst(.v13),
    ],
    products: [
        .library(
            name: "ChatDTO",
            targets: ["ChatDTO"]),
    ],
    dependencies: useLocalDependency ? local : remote,
    targets: [
        .target(
            name: "ChatDTO",
            dependencies: [
                .product(name: "ChatModels", package: useLocalDependency ? "ChatModels" : "chat-models"),
            ]
        ),
        .testTarget(
            name: "ChatDTOTests",
            dependencies: [
                .product(name: "ChatModels", package: useLocalDependency ? "ChatModels" : "chat-models"),
            ],
            resources: []
        ),
    ]
)
