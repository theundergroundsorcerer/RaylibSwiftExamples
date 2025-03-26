/// Examples for RaylibSwift

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let exampleNames: [String: [String]] = [
    "Core": [
        "CoreBasicWindow", "CoreInputKeys", "CoreInputMouse",
        "CoreInputMouseWheel", "CoreInputMultitouch", "CoreInputGestures",
        "CoreInputVirtualControls",
    ],
    "Shapes": [
        "ShapesBasicShapes", "ShapesBouncingBall", "ShapesCollisionArea", "ShapesColorsPalette",
        "ShapesFollowingEyes", "ShapesLinesBezier", "ShapesLogoRaylib", "ShapesLogoRaylibAnim",
        "ShapesRectangleScaling"
    ],
]

func makeExample(name: String, folderName: String) -> Target {
    .executableTarget(
        name: name,
        dependencies: ["RaylibSwift"],
        path: "Sources/\(folderName)/\(name)")
}

func makeExamples() -> [Target] {
    var result: [Target] = []
    // make examples in core

    for (folderName, exampleNames) in exampleNames {
        for exampleName in exampleNames {
            result.append(makeExample(name: exampleName, folderName: folderName))
        }
    }

    return result
}

let package = Package(
    name: "RaylibSwiftExamples",
    dependencies: [
        .package(
            url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "develop")
    ],
    targets: makeExamples()
    /* [
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
            path: "Sources/Shapes/ShapesRectangleScaling"),

        .executableTarget(
            name: "ShapesLinesBezier",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesLinesBezier"),

        .executableTarget(
            name: "ShapesCollisionArea",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesCollisionArea"),

        .executableTarget(
            name: "ShapesFollowingEyes",
            dependencies: ["RaylibSwift"],
            path: "Sources/Shapes/ShapesFollowingEyes"),
    ]*/
)
