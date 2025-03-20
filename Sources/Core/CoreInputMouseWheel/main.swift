/**
 * CoreInputMouseWheel - Mouse Wheel Input
 *
 * This example demonstrates how to detect and use mouse wheel input in RaylibSwift.
 * It shows how to track the mouse wheel movement and use it to adjust values.
 *
 * Based on the raylib "core_input_mouse_wheel" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c
 */

import Foundation
import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "raylib [core] example - input mouse wheel")

var boxPositionY = screenHeight / 2 - 40
var scrollSpeed: Int32 = 4

Window.loop(fps: 60) {
    boxPositionY -= Int32(Mouse.wheelMove) * scrollSpeed

    Graphics.draw {

        Graphics.clearBackground(.rayWhite)

        Graphics.drawRectangle(
            topLeft: (screenWidth / 2 - 40, y: boxPositionY),
            width: 80,
            height: 80,
            color: .gray)

        Graphics.drawText(
            "Use mouse wheel to move the cube up and down",
            at: (x: 10, y: 20),
            fontSize: 20,
            color: .gray)

        Graphics.drawText(
            "Box position Y: \(String(format: "%03d", Int(boxPositionY) ) )",
            at: (x: 10, y: 40),
            fontSize: 20,
            color: .lightGray
        )
    }
}
