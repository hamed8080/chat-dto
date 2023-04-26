// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatDTO",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v10),
        .macOS(.v12),
        .macCatalyst(.v13),
    ],
    products: [
        .library(
            name: "ChatDTO",
            targets: ["ChatDTO"]),
    ],
    dependencies: [
//        .package(path: "../ChatCore"),
//        .package(path: "../ChatModels")
        .package(url: "https://pubgi.fanapsoft.ir/chat/ios/chat-models.git", exact: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ChatDTO",
            dependencies: [.product(name: "ChatModels", package: "chat-models")]
        ),
        .testTarget(
            name: "ChatDTOTests",
            dependencies: ["ChatDTO"],
            resources: []
        ),
    ]
)
