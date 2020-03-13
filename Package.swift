// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tulsi",
    platforms: [
       .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "TulsiGenerator",
            type: .dynamic,
            targets: ["TulsiGenerator"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TulsiGenerator",
            dependencies: [],
            path: "src/TulsiGenerator")
    ],
    swiftLanguageVersions: [.v4]
)
