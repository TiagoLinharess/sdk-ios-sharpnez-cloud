// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharpnezCloud",
    platforms: [.iOS(.v18), .macOS(.v15), .visionOS(.v2)],
    products: [
        .library(
            name: "SharpnezCloud",
            targets: ["SharpnezCloud"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SharpnezCloud",
            dependencies: [],
            path: "SharpnezCloud/SharpnezCloud",
            sources: ["Source"],
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .define("ENABLE_LIBRARY_EVOLUTION", .when(configuration: .release)),
                .unsafeFlags(["-enable-library-evolution", "-emit-module-interface"])
            ]
        )
    ]
)
