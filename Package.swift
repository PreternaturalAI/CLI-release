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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.41/preternatural.artifactbundle.zip",
            checksum: "845bec51215fc449c6615ff49d194152eb7f7251b0942283edd1a05d326cab28"
        )
    ]
)
