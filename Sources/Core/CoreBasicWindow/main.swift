import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "Raylib [core] example - basic window")
Time.setTargetFPS(60)


while(!Window.shouldClose) {
    Graphics.beginDrawing()
    Graphics.clearBackground(Color.rayWhite)
    Graphics.drawText("Congrats! you created your first window!", at: (199, 200), fontSize: 20, color: Color.red)
    Graphics.endDrawing()
}

Window.close()