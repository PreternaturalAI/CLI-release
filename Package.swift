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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.35/preternatural.artifactbundle.zip",
            checksum: "dfae662d17701f03331b9f618ea52f4776061ea821bd7b12541e937d06ac6d0a"
        )
    ]
)
