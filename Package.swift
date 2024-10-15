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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.40/preternatural.artifactbundle.zip",
            checksum: "b27bcc5c2bcec5830b872de9ec25c95ed4e422bcd75f003ce1ab4dae3475c4f3"
        )
    ]
)
