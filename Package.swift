/// Examples for RaylibSwift

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

/// Dictionary of example targets organized by category
/// Key: Category folder name, Value: Array of target names
let exampleNames: [String: [String]] = [
    "Core": [
        "CoreBasicWindow", "CoreInputKeys", "CoreInputMouse",
        "CoreInputMouseWheel", "CoreInputMultitouch", "CoreInputGestures",
        "CoreInputVirtualControls",
    ],
    "Shapes": [
        "ShapesBasicShapes", "ShapesBouncingBall", "ShapesCollisionArea", "ShapesColorsPalette",
        "ShapesEasingsBallAnim", "ShapesEasingsBoxAnim", "ShapesFollowingEyes", "ShapesLinesBezier", "ShapesLogoRaylib", 
        "ShapesLogoRaylibAnim", "ShapesRectangleScaling", "ShapesEasingsRectangleArray",
        "ShapesDrawRing", "ShapesDrawSector"
    ],
]

/// Creates a target for a specific example
/// - Parameters:
///   - name: The name of the example target (used as module name)
///   - folderName: The category folder containing the example
/// - Returns: A configured executable target
func makeExample(name: String, folderName: String) -> Target {
    .executableTarget(
        name: name,
        dependencies: ["RaylibSwift"],
        path: "Sources/\(folderName)/\(name)")
}

/// Generates all example targets based on the exampleNames dictionary
/// - Returns: Array of all executable targets for the package
func makeExamples() -> [Target] {
    var result: [Target] = []
    
    for (folderName, exampleNames) in exampleNames {
        for exampleName in exampleNames {
            result.append(makeExample(name: exampleName, folderName: folderName))
        }
    }

    return result
}

/// The Swift Package definition
let package = Package(
    name: "RaylibSwiftExamples",
    dependencies: [
        .package(
            url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "develop")
    ],
    targets: makeExamples()
)
