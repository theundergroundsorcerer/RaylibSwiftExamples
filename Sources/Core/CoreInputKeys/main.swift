import RaylibSwift

let screenWidth: Int32 = 800
let screenHeigth: Int32 = 450

Window.initialize(800, 450, "raylib [core] example - keyboard input")

var ballPosition = Vector2( x: Float(screenWidth / 2), y: Float(screenHeigth / 2))
Time.setTargetFPS(60)

while(!Window.shouldClose) {
    if (Input.Keyboard.isDown(key: .right)) {
        ballPosition.x += 2.0
    } 
    if (Input.Keyboard.isDown(key: .left)) {
        ballPosition.x -= 2.0
    }
    if (Input.Keyboard.isDown(key: .up)) {
        ballPosition.y -= 2.0
    }
    if (Input.Keyboard.isDown(key: .down)) {
        ballPosition.y += 2.0
    }

    Graphics.beginDrawing()
    Graphics.clearBackground(.rayWhite)
    Graphics.drawText("Move the ball with arrow keys", at: (x: 10, y: 10), fontSize: 20, color: .darkGray)
    Graphics.drawCircle(at: ballPosition, radius: 50, color: .maroon)
    Graphics.endDrawing()
}

Window.close()