/**
 * CoreBasicWindow - Basic Window Creation
 *
 * This example demonstrates how to create a basic window using RaylibSwift.
 * It shows the window creation, drawing process, and proper cleanup.
 *
 * Based on the raylib "core_basic_window" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
 */

import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "raylib [core] example - basic window")

Time.setTargetFPS(60)

while !Window.shouldClose {
    Draw.frame {
        Draw.clearBackground( .rayWhite)
        Draw.text(
            "Congrats! You created your first window!",
            at: (x: 190, y: 200),
            fontSize: 20,
            color: .lightGray
        )
    }
}

Window.close()
