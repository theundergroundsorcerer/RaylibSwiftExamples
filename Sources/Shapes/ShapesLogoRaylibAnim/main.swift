import RaylibSwift

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - raylib logo animation")

var logoPosition: (x: Int32, y:Int32) = (screenWidth - 128, screenHeight - 128)

var frameCounter: Int32 = 0, lettersCount: Int32 = 0 

var rectangleDimensions: (
    topWidth: Int32, 
    bottomWidth: Int32, 
    leftHeigth: Int32, 
    rightHeigth: Int32) = (16, 16, 16, 16)

var animationState: Int32 = 0
var alpha: Float = 1.0

Window.loop(initialFps: 60) {

}