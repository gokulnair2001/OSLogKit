// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OSLogKit",
    platforms: [.iOS(.v14), .macOS(.v11), .tvOS(.v14), .watchOS(.v7), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "OSLogKit",
            targets: ["OSLogKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "OSLogKit",
            dependencies: []),
    ]
)
