/**
 * ShapesLogoRaylibAnim - Animated Raylib Logo
 *
 * This example demonstrates how to create animated graphics using basic shapes and
 * state machines to control multi-stage animations with fading effects.
 *
 * Based on the raylib "shapes_logo_raylib_anim" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib_anim.c
 */

import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - raylib logo animation")

let logoPosition: (x: Int32, y: Int32) = (screenWidth / 2 - 128, screenHeight / 2 - 128)

var framesCounter: Int32 = 0
var lettersCount: Int = 0

var topLeftRectangleWidth: Int32 = 16
var bottomSideRectangleWidth: Int32 = 16
var leftSideRectangleHeight: Int32 = 16
var rightSideRectangleHeight: Int32 = 16

// For tracking animation states - state machine
enum AnimationState: Int32 {
    case smallBoxBlinking = 0
    case topAndLeftGrowing = 1
    case bottomRightGrowing = 2
    case lettersAppearing = 3
    case resetAndReplay = 4
}
var animationState: AnimationState = AnimationState.smallBoxBlinking
let animatedWord: Text = "raylib"
let maxDisplayedLetters: Int = animatedWord.count
var displayedWordEndIndex: String.Index = animatedWord.startIndex

// Controls fading
var alpha: Float = 1.0
Window.loop(initialTargetFps: 60) {
    // Update - based on animation state
    switch animationState {
    case .smallBoxBlinking:
        framesCounter += 1
        if framesCounter == 120 {
            animationState = .topAndLeftGrowing
            framesCounter = 0
        }
    case .topAndLeftGrowing:
        topLeftRectangleWidth += 4
        leftSideRectangleHeight += 4
        if topLeftRectangleWidth == 256 { animationState = .bottomRightGrowing }
    case .bottomRightGrowing:
        bottomSideRectangleWidth += 4
        rightSideRectangleHeight += 4
        if bottomSideRectangleWidth == 256 { animationState = .lettersAppearing }
    case .lettersAppearing:  // letters appearing one by one
        framesCounter += 1
        // every 12 frames - one more letter
        if framesCounter / 12 > 0 {
            lettersCount += 1
            displayedWordEndIndex = animatedWord.index(
                animatedWord.startIndex,
                offsetBy: min(lettersCount, animatedWord.count))
            framesCounter = 0
        }
        // when all letters have appeared, just fade out everything
        if lettersCount >= animatedWord.count + 4 {
            alpha -= 0.02

            if alpha <= 0.0 {
                alpha = 0.0
                animationState = .resetAndReplay
            }
        }
    case .resetAndReplay:
        if Keyboard.isPressed(key: .r) {
            framesCounter = 0
            lettersCount = 0

            topLeftRectangleWidth = 16
            bottomSideRectangleWidth = 16
            leftSideRectangleHeight = 16
            rightSideRectangleHeight = 16

            alpha = 1.0
            animationState = .smallBoxBlinking
            displayedWordEndIndex = animatedWord.startIndex
        }
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)

        switch animationState {
        case .smallBoxBlinking:
            if framesCounter / 15 % 2 == 1 {
                Graphics.drawRectangle(topLeft: logoPosition, width: 16, height: 16, color: .black)
            }

        case .topAndLeftGrowing:
            Graphics.drawRectangle(
                topLeft: logoPosition,
                width: topLeftRectangleWidth,
                height: 16,
                color: .black)
            Graphics.drawRectangle(
                topLeft: logoPosition,
                width: 16,
                height: leftSideRectangleHeight,
                color: .black)

        case .bottomRightGrowing:
            Graphics.drawRectangle(
                topLeft: logoPosition,
                width: topLeftRectangleWidth,
                height: 16,
                color: .black)
            Graphics.drawRectangle(
                topLeft: logoPosition,
                width: 16,
                height: leftSideRectangleHeight,
                color: .black)
            Graphics.drawRectangle(
                topLeft: (x: logoPosition.x + 240, y: logoPosition.y),
                width: 16,
                height: rightSideRectangleHeight,
                color: .black)
            Graphics.drawRectangle(
                topLeft: (x: logoPosition.x, y: logoPosition.y + 240),
                width: bottomSideRectangleWidth,
                height: 16,
                color: .black)

        case .lettersAppearing:
            Graphics.drawRectangle(
                topLeft: logoPosition,
                width: topLeftRectangleWidth,
                height: 16,
                color: .fade(.black, alpha: alpha))
            Graphics.drawRectangle(
                topLeft: (x: logoPosition.x, y: logoPosition.y + 16),
                width: 16,
                height: leftSideRectangleHeight - 32,
                color: .fade(.black, alpha: alpha))
            Graphics.drawRectangle(
                topLeft: (x: logoPosition.x + 240, y: logoPosition.y + 16),
                width: 16,
                height: rightSideRectangleHeight - 32,
                color: .fade(.black, alpha: alpha))
            Graphics.drawRectangle(
                topLeft: (x: logoPosition.x, y: logoPosition.y + 240),
                width: bottomSideRectangleWidth,
                height: 16,
                color: .fade(.black, alpha: alpha))
            Graphics.drawRectangle(
                topLeft: (x: Window.screenWidth / 2 - 112, y: Window.screenHeight / 2 - 112),
                width: 224,
                height: 224,
                color: .fade(.rayWhite, alpha: alpha))
            Graphics.drawText(
                Text(animatedWord[..<displayedWordEndIndex]),
                at: (x: Window.screenWidth / 2 - 44, y: Window.screenHeight / 2 + 48),
                fontSize: 50,
                color: .fade(.black, alpha: alpha)
            )
        case .resetAndReplay:
            Graphics.drawText(
                "[R] REPLAY",
                at: (x: 340, y: 200),
                fontSize: 20,
                color: .gray)
        }
    }
}
