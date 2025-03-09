import RaylibSwift
import Foundation

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "raylib [core] example - input mouse wheel")

var boxPositionY = screenHeight / 2 - 40
var scrollSpeed: Int32 = 4

Time.setTargetFPS(60)

while(!Window.shouldClose) {
    boxPositionY -= Int32(Input.Mouse.wheelMove) * scrollSpeed

    Graphics.beginDrawing()

    Graphics.clearBackground(.rayWhite)
    
    Graphics.drawRectangle(
        at: (screenWidth / 2 - 40, y: boxPositionY),
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

    Graphics.endDrawing()
}

Window.close()