/**
 * CoreBasicWindow - Basic Window Creation
 *
 * This example demonstrates how to create a basic window using RaylibSwift.
 * It shows the initialization, main game loop, and cleanup process.
 *
 * Based on the raylib "core_basic_window" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
 */

import RaylibSwift
import CRaylib

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(
    width: screenWidth, 
    height: screenHeight, 
    title: "raylib [core] example - basic window")

Window.loop(initialTargetFps: 60) {
    Graphics.draw {
        Graphics.clearBackground( .rayWhite)
        Graphics.drawText(
            "Congrats! You created your first window!",
            at: (x: 190, y: 200),
            fontSize: 20,
            color: .lightGray
        )
    }
}
