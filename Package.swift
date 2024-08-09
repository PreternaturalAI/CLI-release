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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.30/preternatural.artifactbundle.zip",
            checksum: "3a057795fce77aa3b591bcb9332c171aa588dc492768e6e5a1c1c61b552407ab"
        )
    ]
)
