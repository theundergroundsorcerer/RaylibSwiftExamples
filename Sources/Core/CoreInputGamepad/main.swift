import RaylibSwift
import Foundation

let xBoxAlias1 = "xbox"
let xBoaxAlias = "x-box"
let psAlias = "playstation"

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

// Set MSAA 4X hint before windows creation
Utils.setConfigFlags(.msaa4xHint)

Window.initialize(screenWidth, screenHeight, "raylib [core] example - gamepad input")

let bundle = Bundle.module

guard let xboxPath = bundle.path(forResource: "xbox", ofType: "png"),
let ps3Path = bundle.path(forResource: "ps3", ofType: "png") else {
    fatalError("Could not find resource images")
} 

print(xboxPath)
print(ps3Path)

let texturePs3Pad = Texture.load(from: ps3Path)
let textureXBoxPad = Texture.load(from: xboxPath)