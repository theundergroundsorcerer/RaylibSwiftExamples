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

Window.initialize(
    width: 800, 
    height: 450, 
    title: "raylib [core] example - keyboard input")

var ballPosition = Vector2(x: Float(screenWidth / 2), y: Float(screenHeigth / 2))
let ballSpeed: Float = 2.0


Window.loop(initialTargetFps: 60) {
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

    Graphics.draw {
        Graphics.clearBackground( .rayWhite)
        Graphics.drawText(
            "Move the ball with arrow keys", at: (x: 10, y: 10), fontSize: 20, color: .darkGray)
        Graphics.drawCircle(at: ballPosition, radius: 50, color: .maroon)
    }
}