/**
 * ShapesCollisionArea - Rectangle Collision Detection with Area Calculation
 *
 * This example demonstrates how to detect collisions between two rectangles
 * and calculate the collision area. It features an automatically moving box
 * and a user-controlled box.
 *
 * The example matches the behavior of the original C implementation:
 * - Collision detection continues to function even when the simulation is paused
 * - Only the automatic movement of the box is paused
 * - This allows users to explore collision scenarios by freely moving the 
 *   player-controlled box while the simulation is paused
 *
 * Based on the raylib "shapes_collision_area" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_collision_area.c
 */

import RaylibSwift

Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - collision area")

// Moving Box
var movingBox = Rectangle(
    topLeft: Vector2(x: 10, y: Float(Window.screenHeight / 2 - 50)),
    width: 200,
    height: 100
)
var movingBoxSpeedX: Float = 240

// playerControlledBox
var playerControlledBox = Rectangle(
    topLeft: Vector2(
        x: Float(Window.screenHeight / 2 - 30), y: Float(Window.screenHeight / 2 - 30)),
    width: 60,
    height: 60
)

// Collision Rectangle
var collisionBox = Rectangle()

// Top menu limits
let screenUpperLimit: Float = 40

let upperMenu = Rectangle(x: 0, y: 0, width: Float(Window.screenWidth), height: screenUpperLimit)

var isPaused = false
var collision = false
var boxesCollide = false

Window.loop(initialTargetFps: 60) {
    if !isPaused {
        movingBox.x += movingBoxSpeedX * Time.lastFrameDuration
    }

    if (movingBox.x + movingBox.width >= Float(Window.screenWidth) && movingBoxSpeedX > 0)
        || (movingBox.x < 0 && movingBoxSpeedX < 0)
    {
        movingBoxSpeedX = -movingBoxSpeedX
    }

    playerControlledBox.topLeft =
        Mouse.position
        - Vector2(x: playerControlledBox.width / 2, y: playerControlledBox.height / 2)

    playerControlledBox.x = max(
        min(playerControlledBox.x, Float(Window.screenWidth) - playerControlledBox.width),
        0)
    playerControlledBox.y = max(
        min(playerControlledBox.y, Float(Window.screenHeight) - playerControlledBox.height),
        screenUpperLimit)

    boxesCollide = playerControlledBox.collides(with: movingBox)
    if boxesCollide {
        collisionBox = playerControlledBox.collisionRectangle(with: movingBox)
    }

    // Equivalent to updating isPaused when space button is pressed
    isPaused = isPaused != Keyboard.isPressed(key: .space)

    Graphics.draw {
        Graphics.clearBackground(.white)
        upperMenu.draw(color: boxesCollide ? .red : .black)
        movingBox.draw(color: .gold)
        playerControlledBox.draw(color: .blue)

        if boxesCollide {
            collisionBox.draw(color: .lime)
            "COLLISION!".draw(
                at: (
                    x: (Window.screenWidth - "COLLISION".measureWidth(fontSize: 20)) / 2,
                    y: Int32(screenUpperLimit) / 2 - 10
                ),
                fontSize: 20,
                color: .black)
            Text(
                format: "Collision Area: %i",
                Int32(collisionBox.width) * Int32(collisionBox.height)
            ).draw(
                at: (x: Window.screenWidth / 2 - 100, y: Int32(screenUpperLimit + 10)),
                fontSize: 20,
                color: .black)
        }
        "Presss SPACE to PAUSE/RESUME".draw(
            at: (x: 20, y: Window.screenHeight - 35),
            fontSize: 20,
            color: .lightGray)

        Graphics.drawFps(at: (x: 10, y: 10))

    }

}
