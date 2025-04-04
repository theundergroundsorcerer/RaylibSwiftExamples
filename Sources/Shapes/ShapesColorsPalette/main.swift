/**
 * ShapesColorsPalette - Colors Palette
 *
 * This example shows predefined raylib colors and allows user interaction to
 * explore them through an interactive color palette display with hover effects.
 *
 * Based on the raylib "shapes_colors_palette" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c
 */
import RaylibSwift

let colors: [Color] = [
    .darkGray, .maroon, .orange, .darkGreen, .darkBlue, .darkPurple, .darkBrown,
    .gray, .red, .gold, .lime, .blue, .violet, .brown,
    .lightGray, .pink, .yellow, .green, .skyBlue, .purple, .beige,
]

let colorNames: [String] = [
    "DARKGRAY", "MAROON", "ORANGE", "DARKGREEN", "DARKBLUE", "DARKPURPLE", "DARKBROWN",
    "GRAY", "RED", "GOLD", "LIME", "BLUE", "VIOLET", "BROWN",
    "LIGHTGRAY", "PINK", "YELLOW", "GREEN", "SKYBLUE", "PURPLE", "BEIGE",
]

if colorNames.count != colors.count {
    fatalError(("Color data has not been initialized propery. Stopping execution"))
}

let maxColorsCount = colors.count

let colorRectangles: [Rectangle] = (0..<maxColorsCount).map { (i: Int) in
    return Rectangle(
        x: 20.0 + 100.0 * Float(i % 7) + 10.0 * Float(i % 7),
        y: 80.0 + 100.0 * Float(i / 7) + 10.0 * Float(i / 7),
        width: 100.0,
        height: 100.0
    )
}

var isMouseOverColorRectangle: [Bool] = [Bool](repeating: false, count: colors.count)

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(
    width: screenWidth, 
    height: screenHeight, 
    title: "raylib [shapes] example - colors palette")

Window.loop(initialTargetFps: 60) {
    let mousePoint = Mouse.position

    for i in 0..<maxColorsCount {
        isMouseOverColorRectangle[i] = colorRectangles[i].contains(mousePoint)
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        for i in 0..<maxColorsCount {
            let rectangleAlpha: Float = isMouseOverColorRectangle[i] ? 0.6 : 1.0
            colorRectangles[i].draw(color: .fade(colors[i], alpha: rectangleAlpha))

            if Keyboard.isDown(key: .space) || isMouseOverColorRectangle[i] {
                Rectangle(
                    topLeft: Vector2(
                        x: colorRectangles[i].x,
                        y: colorRectangles[i].y + colorRectangles[i].height - 26),
                    width: colorRectangles[i].width,
                    height: 20
                ).draw(color: .black)

                colorRectangles[i].drawOutline(color: .fade(.black, alpha: 0.3), thickness: 6)
                colorNames[i].draw(
                    at: (
                        x: Int32(colorRectangles[i].x + colorRectangles[i].width)
                            - Text.measureWidth(of: colorNames[i], fontSize: 10),
                        y: Int32(colorRectangles[i].y + colorRectangles[i].height - 20)
                    ),
                    fontSize: 10,
                    color: colors[i])

            }
        }
    }

}
