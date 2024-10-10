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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.32/preternatural.artifactbundle.zip",
            checksum: "405979661354949b5b6f5d08b545d4f8a0359bdcadf026abe3e25c929fcfc6f4"
        )
    ]
)
