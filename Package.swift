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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.31/preternatural.artifactbundle.zip",
            checksum: "98b24ab0bbc0d1d2b13b34183ce9a59909a260557dd5e024debbcb32c48e5a00"
        )
    ]
)
