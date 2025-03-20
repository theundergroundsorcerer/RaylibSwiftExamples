/**
 * ShapesBouncingBall - Simple Physics Simulation
 *
 * This example demonstrates a basic physics simulation with RaylibSwift.
 * It shows how to create a ball that bounces off the edges of the screen
 * with basic collision detection and movement control.
 *
 * Based on the raylib "shapes_bouncing_ball" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c
 */

import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Utils.setConfigFlags(.msaa4xHint)
Window.initialize(screenWidth, screenHeight, "raylib [shapes] example - bouncing ball")

var ball = Circle(center: (x: screenWidth / 2, y: screenHeight / 2), radius: 20)
var ballSpeed = Vector2(x: 300.0, y: 240.0)

var gameIsPaused = false
var framesCounter: Int32 = 0

Window.loop(fps: 60) {
    // update
    if Keyboard.isPressed(key: .space) {
        gameIsPaused = !gameIsPaused
    }

    if !gameIsPaused {
        ball.move(offset: ballSpeed * Time.lastFrameDuration)

        if (ball.center.x >= Float(Window.screenWidth) - ball.radius && ballSpeed.x > 0)
            || (ball.center.x <= ball.radius && ballSpeed.x < 0)
        {
            ballSpeed.x *= -1.0
        }
        if (ball.center.y >= Float(Window.screenHeight) - ball.radius && ballSpeed.y > 0)
            || (ball.center.y <= ball.radius && ballSpeed.y < 0)
        {
            ballSpeed.y *= -1.0
        }
    } else {
        framesCounter = (framesCounter + 1) % 60
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        Graphics.drawFps(at: (x: 10, y: 10))

        ball.draw(color: .maroon)

        if gameIsPaused && (framesCounter / 30) % 2 == 1 {
            Graphics.drawText("PAUSED", at: (x: 350, y: 200), fontSize: 30, color: .gray)
        } else if !gameIsPaused {
            Graphics.drawText(
                "PRESS SPACE to PAUSE BALL MOVEMENT",
                at: (x: 10, y: Window.screenHeight - 25),
                fontSize: 20,
                color: .lightGray)
        }
    }
}
