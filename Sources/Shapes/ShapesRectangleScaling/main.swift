import RaylibSwift

let mouseScaleMarkSize: Int32 = 12

Window.initialize(
    width: 800, 
    height: 450, 
    title: "raylib [shapes] example - rectangle scaling mouse")

var rectangle = Rectangle(topLeft: Vector2(x: 100, y: 100), width: 200, height: 80)

Window.loop(initialTargetFps: 60) {
    let mousePosition = Mouse.position



}