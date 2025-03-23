/**
 * ShapesLinesBezier - Cubic-Bezier Lines
 * 
 * This example demonstrates how to draw a cubic-bezier curve between two points
 * and create interactive control points that can be moved with the mouse.
 * 
 * Based on the raylib "shapes_lines_bezier" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c
 */

import RaylibSwift

// Enable MSAA 4X anti-aliasing for smoother lines
Utils.setConfigFlags(.msaa4xHint)

Window.initialize(width: 800, height: 450, title: "raylib [shapes] - cubic beizer lines")

var startPoint = Vector2(x: 30, y: 30)
var endPoint: Vector2 = Vector2(Float(Window.screenWidth - 30), Float(Window.screenHeight - 30))

var moveStartPoint = false
var moveEndPoint = false

Window.loop(initialTargetFps: 60) {
    let mousePosition = Mouse.position

    var startPointCircle = Circle(center: startPoint, radius: 10)
    var endPointCircle = Circle(center: endPoint, radius: 10)
    
    if startPointCircle.contains(mousePosition) && Mouse.isDown(button: .left) {
        moveStartPoint = true
    } else if endPointCircle.contains(mousePosition) && Mouse.isDown(button: .left) {
        moveEndPoint = true
    }

    if moveStartPoint {
        startPoint = mousePosition
        startPointCircle.move(to: startPoint)
        moveStartPoint = !Mouse.isReleased(button: .left)
    }
    startPointCircle.resize(radius: startPointCircle.contains(mousePosition) ? 14 : 8)

    if moveEndPoint {
        endPoint = mousePosition
        endPointCircle.move(to: endPoint)
        moveEndPoint = !Mouse.isReleased(button: .left)
    }
    endPointCircle.resize(radius: endPointCircle.contains(mousePosition) ? 14 : 8)

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        "MOVE START-END POINTS WITH MOUSE".draw(
            at: (x: 15, y: 20), 
            fontSize: 20, 
            color: .gray)
        Graphics.drawLineBezier(from: startPoint, to: endPoint, thickness: 4, color: .blue)
        startPointCircle.draw(color: moveStartPoint ? .red : .blue)
        endPointCircle.draw(color: moveEndPoint ? .red : .blue)
    }
}
