import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - raylib logo animation")

var logoPosition: (x: Int32, y: Int32) = (screenWidth - 128, screenHeight - 128)

var framesCounter: Int32 = 0
var lettersCount: Int32 = 0

var rectangleDimensions:
    (
        topSideWidth: Int32,
        bottomSideWidth: Int32,
        leftSideHeight: Int32,
        rightSideHeight: Int32
    ) = (16, 16, 16, 16)

// For tracking animation states - state machine
var animationState: Int32 = 0

// Controls fading
var alpha: Float = 1.0
Window.loop(initialTargetFps: 60) {
    if animationState == 0 {
        framesCounter += 1

        if framesCounter == 120 {
            animationState = 1
            framesCounter = 0
        }
    } else if animationState == 1 {
        rectangleDimensions.topSideWidth += 4
        rectangleDimensions.leftSideHeight += 4

        if rectangleDimensions.topSideWidth == 256 {
            animationState = 2
        }
    } else if animationState == 2 {
        rectangleDimensions.bottomSideWidth += 4
        rectangleDimensions.rightSideHeight += 4

        if rectangleDimensions.bottomSideWidth == 256 {
            animationState = 3
        }
    } else if animationState == 3 {
        framesCounter += 1

        if framesCounter / 12 != 0 {

        }
    }
}
