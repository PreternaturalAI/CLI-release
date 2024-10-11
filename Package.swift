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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.34/preternatural.artifactbundle.zip",
            checksum: "72ffa9d616e2e0a4d02ebcac0c162539ac4f82a1f50b38e747742ac497f62acd"
        )
    ]
)
