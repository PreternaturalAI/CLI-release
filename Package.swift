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
            url: "https://github.com/PreternaturalAI/CLI-release/releases/download/0.0.37/preternatural.artifactbundle.zip",
            checksum: "8dc6302880e57b2f0aeb25ceb50f5aabee38b3ceaf530f384432041e89851e90"
        )
    ]
)
