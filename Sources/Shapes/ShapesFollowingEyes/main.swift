/**
 * ShapesFollowingEyes - Interactive Eyes Following the Mouse
 *
 * This example demonstrates how to create interactive eyes that follow
 * the mouse cursor. It uses vector mathematics to calculate the direction
 * and constrain the movement of the iris within the eye sclera.
 *
 * Based on the raylib "shapes_following_eyes" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c
 */

import Foundation
import RaylibSwift

/// Moves the iris circle toward the destination point, constrained within the sclera circle
/// The iris will move to the edge of its allowed range if the destination is beyond that range
@inline(__always)
func moveIris(_ iris: inout Circle, from sclera: Circle, towards destinationPoint: Vector2) {
    // If destination is within allowed range, move directly to that point
    guard !Circle(center: sclera.center, radius: irisMaxDistance).contains(destinationPoint)
    else {
        iris.move(to: destinationPoint)
        return
    }

    // Calculate direction and angle from sclera center to destination
    let destinationDirection = destinationPoint - sclera.center
    let destinationAngle = atan2(destinationDirection.y, destinationDirection.x)
    
    // Calculate the maximum allowed displacement for the iris
    let displacementFromSclera = Vector2(
        x: irisMaxDistance*cos(destinationAngle),
        y: irisMaxDistance*sin(destinationAngle)
    )
    
    // Move iris to the edge of its allowed range
    iris.move(to: sclera.center + displacementFromSclera)
}

// Initialization
//--------------------------------------------------------------------------------------
Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - following eyes")

// Define the sclera (white part of the eyes)
let scleraRadius: Float = 80
var leftSclera: Circle = Circle(
    center: (x: Window.screenWidth / 2 - 100, y: Window.screenHeight / 2),
    radius: scleraRadius)
var rightSclera: Circle = Circle(
    center: (x: Window.screenWidth / 2 + 100, y: Window.screenHeight / 2),
    radius: scleraRadius)

// Define the iris (colored part of the eyes)
let irisRadius: Float = 24
var leftIris: Circle = Circle(center: leftSclera.center, radius: irisRadius)
var rightIris: Circle = Circle(center: rightSclera.center, radius: irisRadius)
var leftLens: Circle = Circle(center: leftIris.center, radius: 10)
var rightLens: Circle = Circle(center: rightIris.center, radius: 10)

// Calculate maximum distance iris can move from center
let irisMaxDistance: Float = scleraRadius - irisRadius

// Main game loop
//--------------------------------------------------------------------------------------
Window.loop(initialTargetFps: 60) {
    // Update
    //-----------------------------------------------------------------------------------
    let mousePosition = Mouse.position
    moveIris(&leftIris, from: leftSclera, towards: mousePosition)
    moveIris(&rightIris, from: rightSclera, towards: mousePosition)
    leftLens.move(to: leftIris.center)
    rightLens.move(to: rightIris.center)
 
    // Draw
    //-----------------------------------------------------------------------------------
    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        
        // Draw left eye components
        leftSclera.draw(color: .lightGray)
        leftIris.draw(color: .brown)
        leftLens.draw(color: .black)

        // Draw right eye components
        rightSclera.draw(color: .lightGray)
        rightIris.draw(color: .darkGreen)
        rightLens.draw(color: .black)

        Graphics.drawFps(at: (x: 10, y: 10))
    }
}
