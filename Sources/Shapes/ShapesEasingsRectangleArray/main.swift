//
// ShapesEasingsRectangleArray - Easing animations applied to a grid of rectangles
//
// This example demonstrates using easing animations on multiple objects simultaneously.
// A grid of rectangles shrinks and rotates with circular easing. Press SPACE to restart.
//
// Original example: https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_rectangle_array.c
//

import RaylibSwift

let screenWidth = I(800)
let screenHeight = I(450)
let rectanglesWidth = F(50)
let rectanglesHeight = F(50)
let maxRectanglesPerRow = screenWidth / Int32(rectanglesHeight.rounded())
let maxRectanglesPerColumn = screenHeight / Int32(rectanglesHeight.rounded())
let playTimeFrames = I(240)

Window.initialize(
    width: screenWidth,
    height: screenHeight,
    title: "raylib [shapes] example - easings rectangle array")

// Create rectangles array
var rectangles = [Rectangle]()
rectangles.reserveCapacity(Int(maxRectanglesPerRow * maxRectanglesPerColumn))

// Initialize rectangles in a grid
for y in 0...maxRectanglesPerColumn {
    for x in 0...maxRectanglesPerRow {
        rectangles.append(
            Rectangle(
                x: rectanglesWidth / 2 + rectanglesHeight * Float(x),
                y: rectanglesHeight / 2 + rectanglesHeight * Float(y),
                width: rectanglesWidth,
                height: rectanglesHeight)
        )
    }
}

// Animation state variables
var framesCounter = I(0)
var isAnimationActive = true

// Main game loop
Window.loop(initialTargetFps: 60) {
    // Update animation frame counter
    framesCounter = isAnimationActive ? framesCounter + 1 : 0
    let animationProgress = Progress(time: F(framesCounter), duration: F(playTimeFrames))
    
    // Calculate current animation values based on progress
    let (currentRectangleHeight, currentRectangleWidth, rotation) =
        if isAnimationActive {
            (
                Ease.circularOut(
                    from: rectanglesHeight, to: 0, progress: animationProgress),
                Ease.circularOut(
                    from: rectanglesWidth, to: 0, progress: animationProgress),
                Ease.linear(from: 0, to: 360, progress: animationProgress)
            )
        } else { (rectanglesWidth, rectanglesHeight, 0) }

    // Update all rectangles with current animation values
    for i in rectangles.indices {
        rectangles[i].height = max(currentRectangleHeight, 0)
        rectangles[i].width = max(currentRectangleWidth, 0)
    }

    // Check if animation has finished
    if isAnimationActive && currentRectangleHeight == 0 && currentRectangleWidth == 0 {
        isAnimationActive = false
    }
    
    // Restart animation when space is pressed
    if !isAnimationActive && Keyboard.isDown(key: .space) {
        isAnimationActive = true
    }    

    // Draw
    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        if isAnimationActive {
            // Draw all rectangles with rotation
            for i in rectangles.indices {
                rectangles[i].draw(
                    origin: Vector2(rectangles[i].width / 2, rectangles[i].height / 2),
                    rotation: rotation,
                    color: .red)
            }
        } else {
            // Show prompt to restart animation
            Text("PRESSS [SPACE] TO PLAY AGAIN").draw(
                at: (x: 240, y: 200),
                fontSize: 20,
                color: .gray)
        }
    }
}
