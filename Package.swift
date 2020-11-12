// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ThreadSafe",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .watchOS(.v2),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "ThreadSafe",
            targets: ["ThreadSafe"]
        ),
    ],
    targets: [
        .target(
            name: "ThreadSafe",
            dependencies: []),
        .testTarget(
            name: "ThreadSafeTests",
            dependencies: ["ThreadSafe"]
        ),
    ],
    swiftLanguageVersions: [.v4, .v5]
)
