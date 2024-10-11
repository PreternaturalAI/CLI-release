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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.33/preternatural.artifactbundle.zip",
            checksum: "1c193ed4601f6a091ac96edb10475abbb6e0ed9b9f295ac7329f339890d617eb"
        )
    ]
)
