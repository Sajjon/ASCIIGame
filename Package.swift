// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsciiGame",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    dependencies: [
         .package(url: "https://github.com/JohnSundell/ShellOut", from: "2.3.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "AsciiGame",
            dependencies: ["ShellOut"]),
        .testTarget(
            name: "AsciiGameTests",
            dependencies: ["AsciiGame"]),
    ]
)
