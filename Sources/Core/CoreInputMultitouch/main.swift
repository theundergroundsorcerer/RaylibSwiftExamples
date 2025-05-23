/**
 * CoreInputMultitouch - Multitouch Input
 *
 * This example demonstrates how to handle multitouch input in RaylibSwift.
 * It shows how to detect and respond to multiple simultaneous touch points.
 *
 * Based on the raylib "core_input_multitouch" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_input_multitouch.c
 */

import RaylibSwift

let maxTouchPoints: Int32 = 10

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(
    width: screenWidth, 
    height: screenHeight, 
    title: "raylib [core] example - input multitouch")

var touchPositions = [Vector2](repeating: Vector2(0, 0), count: 10)

Window.loop(initialTargetFps: 60) {
    var touchCount = Touch.pointCount
    if touchCount > maxTouchPoints {
        touchCount = maxTouchPoints
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)

        for i in 0..<Int(touchCount) {
            if touchPositions[i].x > 0 && touchPositions[i].y > 0 {
                Graphics.drawCircle(at: touchPositions[i], radius: 34, color: .orange)
                Graphics.drawText(
                    "\(i)",
                    at: (x: Int32(touchPositions[i].x - 10), y: Int32(touchPositions[i].y - 70)),
                    fontSize: 40,
                    color: .black
                )
            }
        }

        Graphics.drawText(
            "Touch the screen at multiple locations to get multiple balls",
            at: (x: 10, y: 10),
            fontSize: 20,
            color: .darkGray
        )
    }
}
