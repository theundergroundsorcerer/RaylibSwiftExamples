/**
 * ShapesLogoRaylib - Raylib Logo Using Shapes
 *
 * This example demonstrates how to create logos and graphics using basic shapes
 * instead of textures, showcasing Raylib's drawing capabilities.
 *
 * Based on the raylib "shapes_logo_raylib" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib.c
 */

import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(800, 450, "raylib [shapes] example - ralyibg logo using shapes")

Window.loop(fps: 60) {
    Graphics.draw {
        Graphics.clearBackground(.rayWhite)

        Rectangle(
            topLeft: Vector2(x: Float(screenWidth / 2 - 128), y: Float(screenHeight / 2 - 128)),
            width: 256,
            height: 256
        ).draw(color: .black)

        Rectangle(
            topLeft: Vector2(x: Float(screenWidth / 2 - 112), y: Float(screenHeight / 2 - 112)),
            width: 224,
            height: 224
        ).draw(color: .white)

        "raylib".draw(
            at: (x: screenWidth / 2 - 44, y: screenHeight / 2 + 48), 
            fontSize: 50, 
            color: .black)
        
        "this is NOT a texture".draw(
            at: (x: 350, y: 370), 
            fontSize: 10, 
            color: .gray)
    }

}
