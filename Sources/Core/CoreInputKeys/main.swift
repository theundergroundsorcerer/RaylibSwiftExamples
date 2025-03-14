/**
 * CoreInputKeys - Basic Keyboard Input
 *
 * This example demonstrates basic keyboard input handling in RaylibSwift.
 * It shows how to move an object (a ball) on screen using the arrow keys.
 *
 * Based on the raylib "core_input_keys" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c
 */

import RaylibSwift

let screenWidth: Int32 = 800
let screenHeigth: Int32 = 450

Window.initialize(800, 450, "raylib [core] example - keyboard input")

var ballPosition = Vector2(x: Float(screenWidth / 2), y: Float(screenHeigth / 2))
let ballSpeed: Float = 2.0
Time.setTargetFPS(60)

while !Window.shouldClose {
    // Update ball position based on arrow key input
    if Keyboard.isDown(key: .right) {
        ballPosition.x += ballSpeed
    }
    if Keyboard.isDown(key: .left) {
        ballPosition.x -= ballSpeed
    }
    if Keyboard.isDown(key: .up) {
        ballPosition.y -= ballSpeed
    }
    if Keyboard.isDown(key: .down) {
        ballPosition.y += ballSpeed
    }

    Draw.frame {
        Draw.clearBackground( .rayWhite)
        Draw.text(
            "Move the ball with arrow keys", at: (x: 10, y: 10), fontSize: 20, color: .darkGray)
        Draw.circle(at: ballPosition, radius: 50, color: .maroon)
    }
}

Window.close()
