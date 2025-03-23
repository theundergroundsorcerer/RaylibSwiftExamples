/// Examples for RaylibSwift

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RaylibSwiftExamples",
    dependencies: [.package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "develop")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "CoreBasicWindow",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreBasicWindow"),

        .executableTarget(
            name: "CoreInputKeys",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputKeys"),

        .executableTarget(
            name: "CoreInputMouse",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputMouse"),

        .executableTarget(
            name: "CoreInputMouseWheel",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputMouseWheel"),

        .executableTarget(
            name: "CoreInputMultitouch",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputMultitouch"),

        .executableTarget(
            name: "CoreInputGestures",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputGestures"),

        .executableTarget(
            name: "CoreInputVirtualControls",
            dependencies: ["RaylibSwift"],
            path: "Sources/Core/CoreInputVirtualControls"),

        .executableTarget(
            name: "ShapesBasicShapes",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesBasicShapes"),

        .executableTarget(
            name: "ShapesBouncingBall",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesBouncingBall"),

        .executableTarget(
            name: "ShapesColorsPalette",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesColorsPalette"),

        .executableTarget(
            name: "ShapesLogoRaylib",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesLogoRaylib"),

        .executableTarget(
            name: "ShapesLogoRaylibAnim",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesLogoRaylibAnim"),

        .executableTarget(
            name: "ShapesRectangleScaling",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesRectangleScaling"
        ),

        .executableTarget(
            name: "ShapesLinesBezier",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesLinesBezier"
        )
    ]
)
