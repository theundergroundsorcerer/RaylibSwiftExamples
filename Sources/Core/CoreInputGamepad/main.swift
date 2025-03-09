import RaylibSwift

let xBoxAlias1 = "xbox"
let xBoaxAlias = "x-box"
let psAlias = "playstation"

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

// Set MSAA 4X hint before windows creation
Utils.setConfigFlags(.msaa4xHint)

Window.initialize(screenWidth, screenHeight, "raylib [core] example - gamepad input")
