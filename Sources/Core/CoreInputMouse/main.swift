/**
 * CoreInputMouse - Mouse Input Example
 *
 * This example demonstrates basic mouse input handling in RaylibSwift.
 * It shows how to track the mouse position and detect mouse button clicks.
 *
 * Based on the raylib "core_input_mouse" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c
 */
import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "raylib [core] example- mouse input")

Time.setTargetFPS(60)
var ballPosition = Vector2(x: -100, y: -100)
var ballColor = Color.darkBlue

while !Window.shouldClose {
    if Input.Keyboard.isPressed(key: .h) {
        if Window.Cursor.isHidden == false {
            Window.Cursor.hide()
        } else {
            Window.Cursor.show()
        }
    }

    let ballPosition = Input.Mouse.position
    if Input.Mouse.isPressed(button: .left) {
        ballColor = .maroon
    } else if Input.Mouse.isPressed(button: .middle) {
        ballColor = .maroon
    } else if Input.Mouse.isPressed(button: .right) {
        ballColor = .darkBlue
    } else if Input.Mouse.isPressed(button: .side) {
        ballColor = .purple
    } else if Input.Mouse.isPressed(button: .extra) {
        ballColor = .yellow
    } else if Input.Mouse.isPressed(button: .forward) {
        ballColor = .orange
    } else if Input.Mouse.isPressed(button: .back) {
        ballColor = .beige
    }

    // Draw
    Draw.frame {
        Draw.clearBackground( .white)
        Draw.circle(at: ballPosition, radius: 40, color: ballColor)

        Draw.text(
            "Move ball with mouse and click mouse button to change color",
            at: (x: 10, y: 10),
            fontSize: 20,
            color: ballColor
        )

        Draw.text(
            "Press 'H' to toggle cursor visibility",
            at: (x: 10, y: 30),
            fontSize: 20,
            color: .darkGray
        )

        if Window.Cursor.isHidden {
            Draw.text(
                "Cursor Hidden",
                at: (x: 20, y: 60),
                fontSize: 20,
                color: .red)
        }

    }
}

Window.close()
