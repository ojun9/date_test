// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "date_test",
    platforms: [.macOS("14.0"), .iOS("17.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "date_test",
            targets: ["date_test"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ojun9/swift-foundation", branch: "parkera/calendar_sequence")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "date_test",
            dependencies: [
                .product(name: "FoundationPreview", package: "swift-foundation")
            ]
        ),
        .testTarget(
            name: "date_testTests",
            dependencies: ["date_test"]
        ),
    ]
)
