/**
 * ShapesRectangleScaling - Rectangle Scaling with Mouse
 *
 * This example demonstrates how to implement interactive rectangle scaling
 * using the mouse. It shows collision detection and mouse interaction with
 * a graphical resize handle in the corner of the rectangle.
 *
 * Based on the raylib "shapes_rectangle_scaling" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_scaling.c
 */

import RaylibSwift

let mouseScaleMarkSize: Float = 12

Window.initialize(
    width: 800,
    height: 450,
    title: "raylib [shapes] example - rectangle scaling mouse")

var rectangle = Rectangle(topLeft: Vector2(x: 100, y: 100), width: 200, height: 80)
var mouseScaleReady = false
var mouseScaleMode = false

Window.loop(initialTargetFps: 60) {

    let mousePosition = Mouse.position
    // the position to click to resize
    let resizeHandleArea = Rectangle(
        topLeft: Vector2(
            x: rectangle.x + rectangle.width - mouseScaleMarkSize,
            y: rectangle.y + rectangle.height - mouseScaleMarkSize),
        width: mouseScaleMarkSize,
        height: mouseScaleMarkSize
    )

    mouseScaleReady = resizeHandleArea.contains(mousePosition) || mouseScaleMode
    mouseScaleMode = mouseScaleMode || (mouseScaleReady && Mouse.isPressed(button: .left))

    if mouseScaleMode {
        rectangle.width = mousePosition.x - rectangle.x
        rectangle.height = mousePosition.y - rectangle.y

        // Check minimum rectangle size
        if rectangle.width < mouseScaleMarkSize { rectangle.width = mouseScaleMarkSize }
        if rectangle.height < mouseScaleMarkSize { rectangle.height = mouseScaleMarkSize }

        // Check maximum rec size
        if rectangle.width > Float(Window.screenWidth) - rectangle.x {
            rectangle.width = Float(Window.screenWidth) - rectangle.x
        }
        if rectangle.height > Float(Window.screenHeight) - rectangle.y {
            rectangle.height = Float(Window.screenHeight) - rectangle.y
        }

        if Mouse.isReleased(button: .left) { mouseScaleMode = false }
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        "Scale rectangle dragging from bottom-right corner".draw(
            at: (x: 10, y: 10),
            fontSize: 20,
            color: .gray)

        rectangle.draw(color: .fade(.green, alpha: 0.5))
        if mouseScaleReady {
            rectangle.drawOutline(color: .red, thickness: 1)
            Triangle(
                Vector2(
                    x: rectangle.x + rectangle.width - mouseScaleMarkSize,
                    y: rectangle.y + rectangle.height),
                Vector2(x: rectangle.x + rectangle.width, y: rectangle.y + rectangle.height),
                Vector2(
                    x: rectangle.x + rectangle.width,
                    y: rectangle.y + rectangle.height - mouseScaleMarkSize)
            ).draw(color: .red)
        }
    }
}
