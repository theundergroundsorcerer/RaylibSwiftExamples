/**
 * ShapesEasingsBoxAnim - Box Animation with Easing Functions
 *
 * This example demonstrates how to use different easing functions to create
 * smooth animations for a rectangle. It shows sequential animations including
 * movement, scaling, rotation, and transparency effects.
 *
 * Based on the raylib "shapes_easings_box_anim" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_box_anim.c
 */

import RaylibSwift

// Initialization
//--------------------------------------------------------------------------------------
Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - easings box anim")

// Define the rectangle that will be animated
var rectangle = Rectangle(
    topLeft: Vector2(x: Float(Window.screenWidth / 2), y: -100),
    width: 100,
    height: 100)

// Animation properties
var rotation = F(0)
var alpha = F(1.0)

/// Represents the different animation states of the box
enum AnimationState: Int {
    case moveBox = 0         // Box moving from top to center
    case scaleBox = 1        // Box scaling width and height
    case rotateBox = 2       // Box rotating
    case increaseBarSize = 3 // Box increasing in height (bar shape)
    case fadeOut = 4         // Box fading out
    case over = 5            // Animation complete

    /// Returns the next state in the animation sequence
    var next: AnimationState {
        AnimationState(rawValue: self.rawValue + 1) ?? .moveBox
    }
}

// Define animation control variables
var animationState: AnimationState = .moveBox
var framesCounter = I32(0)

// Main game loop
//--------------------------------------------------------------------------------------
Window.loop(initialTargetFps: 24) {
    // Update
    //-----------------------------------------------------------------------------------
    
    // Update animation based on current state
    switch animationState {
    case .moveBox:
        // Move box from top to center with elastic easing
        framesCounter += 1
        rectangle.y = Ease.elasticOut(
            from: -100,
            to: Float(Window.screenHeight / 2),
            progress: Progress(time: Float(framesCounter), duration: 120))
        if framesCounter >= 120 {
            framesCounter = 0
            animationState = animationState.next
        }

    case .scaleBox:
        // Scale box width and height with bounce easing
        framesCounter += 1
        let animationProgress = Progress(time: Float(framesCounter), duration: 120)
        rectangle.height = Ease.bounceOut(from: 100, to: 10, progress: animationProgress)
        rectangle.width = Ease.bounceOut(
            from: 100, to: Float(100 + Window.screenWidth), progress: animationProgress)
        if framesCounter >= 120 {
            framesCounter = 0
            animationState = animationState.next
        }
        
    case .rotateBox:
        // Rotate box with quadratic easing
        framesCounter += 1
        rotation = Ease.quadraticOut(
            from: 0, to: 270,
            progress: Progress(time: Float(framesCounter), duration: 240))
        if framesCounter >= 240 {
            framesCounter = 0
            animationState = animationState.next
        }

    case .increaseBarSize:
        // Increase box height (creating bar effect) with circular easing
        framesCounter += 1
        rectangle.height = Ease.circularOut(
            from: 10,
            to: Float(Window.screenWidth + 10),
            progress: Progress(time: Float(framesCounter), duration: 120)
        )
        if framesCounter >= 120 {
            framesCounter = 0
            animationState = animationState.next
        }
        
    case .fadeOut:
        // Fade out box with sine easing
        framesCounter += 1
        alpha = Ease.sineOut(
            from: 1, to: 0, progress: Progress(time: Float(framesCounter), duration: 160))
        if framesCounter >= 160 {
            framesCounter = 0
            animationState = animationState.next
        }
        default: break
    }

    // Reset animation on space key press
    if Keyboard.isPressed(key: .space) {
        rectangle = Rectangle(
            topLeft: Vector2(x: Float(Window.screenWidth / 2), y: -100),
            width: 100,
            height: 100)
        rotation = 0
        alpha = 1
        animationState = .moveBox
        framesCounter = 0
    }

    // Draw
    //-----------------------------------------------------------------------------------
    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        
        // Draw the animated rectangle with current properties
        Graphics.drawRectangle(
            rectangle, 
            origin: Vector2(rectangle.width / 2, rectangle.height / 2), 
            rotation: rotation, 
            color: .fade(.black, alpha: alpha))
            
        Text("PRESS [SPACE] TO RESET BOX ANIMATION").draw(
            at: (x: 10, y: Window.screenHeight - 25), 
            fontSize: 20, 
            color: .lightGray)
    }
}
