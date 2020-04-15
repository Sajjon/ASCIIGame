// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Heroes3",
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
            name: "Heroes3",
            dependencies: ["ShellOut"]),
        .testTarget(
            name: "Heroes3Tests",
            dependencies: ["Heroes3"]),
    ]
)
