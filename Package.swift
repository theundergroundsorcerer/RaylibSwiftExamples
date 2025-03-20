/// Examples for RaylibSwift

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RaylibSwiftExamples",
    dependencies: [.package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "main")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "CoreBasicWindow",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core//CoreBasicWindow"),
            
        .executableTarget(
            name: "CoreInputKeys",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputKeys"),

        .executableTarget(
            name: "CoreInputMouse",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputMouse"
        ),

        .executableTarget(
            name: "CoreInputMouseWheel",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputMouseWheel"
        )
    ]
)
