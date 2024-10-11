// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "preternatural",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "preternatural", targets: ["dummy"])
    ],
    targets: [
        .executableTarget(
            name: "dummy"
        ),
        .binaryTarget(
            name: "preternatural",
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.38/preternatural.artifactbundle.zip",
            checksum: "8822e6a9d49de784874ebee7bf44dd3c9d28333c040aad680f26ccc66bb3350e"
        )
    ]
)
