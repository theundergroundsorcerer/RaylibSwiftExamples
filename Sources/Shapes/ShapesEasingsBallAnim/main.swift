/**
 * ShapesEasingsBallAnim - Ball Animation with Easing Functions
 *
 * This example demonstrates how to use easing functions to create
 * smooth animations. It shows a ball moving through several animation
 * states including position change, size change, and transparency.
 *
 * Based on the raylib "shapes_easings_ball_anim" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_ball_anim.c
 */

import RaylibSwift

// Initialization
//--------------------------------------------------------------------------------------
Window.initialize(width: 800, height: 450, title: "raylib [shapes] examples - easings ball anim")

/// Represents the different animation states of the ball
enum BallState: Int, CaseIterable {
    case move = 0        // Ball moving from left to center
    case increaseSize = 1 // Ball increasing in size
    case changeAlpha = 2  // Ball changing transparency
    case reset = 3        // Animation complete, waiting for reset
    
    /// Returns the next state in the animation sequence
    var next: BallState {
        switch self {
        case .move:
            .increaseSize
        case .increaseSize:
            .changeAlpha
        case .changeAlpha:
            .reset
        case .reset:
            .move
        }
    }
}

// Define animation variables
//--------------------------------------------------------------------------------------
var framesCounter: Int = 0
var ball: Circle = Circle(center: (x: -100, y: 200), radius: 20)
var ballAlpha: Float = 0
var ballState: BallState = .move

// Main game loop
//--------------------------------------------------------------------------------------
Window.loop(initialTargetFps: 60) {
    // Update
    //-----------------------------------------------------------------------------------
    
    // Update animation based on ballState
    switch ballState {
    case .move:
        // Move ball from left to center with elastic easing
        framesCounter += 1
        ball.move(
            to: Vector2(
                x: Ease.elasticOut(
                    from: -100,
                    to: Float(Window.screenWidth / 2 + 100),
                    progress: Progress(time: Float(framesCounter), duration: 120)),
                y: ball.center.y))
        if framesCounter >= 120 {
            framesCounter = 0
            ballState = ballState.next
        }

    case .increaseSize:
        // Increase ball size with elastic easing
        framesCounter += 1
        ball.resize(
            radius: Ease.elasticIn(
                from: 20,
                to: 500,
                progress: Progress(time: Float(framesCounter), duration: 200)))
        if framesCounter >= 200 {
            framesCounter = 0
            ballState = ballState.next
        }

    case .changeAlpha:
        // Change ball alpha (transparency) with cubic easing
        framesCounter += 1
        ballAlpha = Ease.cubicOut(
            from: 0, to: 1,
            progress: Progress(time: Float(framesCounter), duration: 200))
        if framesCounter >= 200 {
            framesCounter = 0
            ballState = ballState.next
        }
    case .reset:
        // Wait for user to restart animation
        if Keyboard.isPressed(key: .enter) {
            ball.move(to: Vector2(-100, ball.center.y))
            ball.resize(radius: 20)
            ballAlpha = 0
            ballState = .move
        }
    }

    // Reset animation timing on R key press
    if Keyboard.isPressed(key: .r) {
        framesCounter = 0
    }

    // Draw
    //-----------------------------------------------------------------------------------
    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        
        // Draw green background during alpha change state
        if ballState.rawValue >= 2 {
            Graphics.drawRectangle(
                topLeft: (x: 0, y: 0), 
                width: Window.screenWidth, 
                height: Window.screenHeight, 
                color: .green)
        }
        
        // Draw ball with appropriate transparency
        ball.draw(color: .fade(.red, alpha: 1.0 - ballAlpha))

        // Show restart instruction when animation is complete
        if ballState.rawValue == 3 {
            Text("PRESS [ENTER] TO PLAY AGAIN!").draw(
                at: (x: 240, y: 200), 
                fontSize: 20, 
                color: .black)
        }
    }
}
