import RaylibSwift

public enum PadButton: Int32 {
    case none = -1
    case up = 0
    case left = 1
    case right = 2
    case down = 3

    public static var max: Int32 {
        4
    }
}

let screenWidth: Int32 = 800
let screeHeight: Int32 = 450

Window.initialize(screenWidth, screeHeight, "raylib [core] example - input virtual controls")

var padPosition = Vector(100, 350)
let buttonRadius: Float = 30

let buttonPositions = [
    Vector2(x: padPosition.x, y: padPosition.y - buttonRadius * 1.5),  // Button up
    Vector2(x: padPosition.x - buttonRadius * 1.5, y: padPosition.y),  // Button left
    Vector2(x: padPosition.x + buttonRadius * 1.5, y: padPosition.y),  // Button right
    Vector2(x: padPosition.x, y: padPosition.y + buttonRadius * 1.5),  // Button down
]

let buttonLabels = ["Y", "X", "B", "A"]
let buttonLabelColors: [Color] = [.yellow, .blue, .red, .green]

var playerPosition = Vector2(Float(screenWidth / 2), Float(screeHeight / 2))
let playerSpeed: Float = 75

Window.loop(fps: 60) {
    let inputPosition =
        if Touch.pointCount > 0 {
            Touch.position(index: 0)
        } else {
            Mouse.position
        }

    // Reset pressetd button to none
    var pressedButton = PadButton.none

    // Make sure user is pressing left mouse button if they're from desktop
    if Touch.pointCount > 0 || (Touch.pointCount == 0 && Mouse.isDown(button: .left)) {
        for i in 0..<PadButton.max {
            // calculate whether the distance of mouse press from the center of ith button
            // is smaller than the radius of the button
            let deltaX = buttonPositions[Int(i)].x - inputPosition.x
            let deltaY = buttonPositions[Int(i)].y - inputPosition.y

            if deltaX*deltaX + deltaY*deltaY < buttonRadius*buttonRadius {
                pressedButton = PadButton(rawValue: i) ?? .none
                break
            }
        }
    }

    let frameTime = Time.frameTime
    switch pressedButton {
    case .up: playerPosition.y -= playerSpeed * frameTime
    case .left: playerPosition.x -= playerSpeed * frameTime
    case .right: playerPosition.x += playerSpeed * frameTime
    case .down: playerPosition.y += playerSpeed * frameTime
    default: break
    }

    Draw.frame {
        Draw.clearBackground(.rayWhite)

        // Draw player position
        Circle(center: playerPosition, radius: 50).draw(usingColor: .maroon)

        // Draw GUI
        for i in 0..<PadButton.max {
            let buttonIndex = Int(i)
            // get button color
            let buttonColor: Color = pressedButton.rawValue == i ? .darkGray : .black

            // draw button
            let button = Circle(center: buttonPositions[buttonIndex], radius: buttonRadius)
            button.draw(usingColor: buttonColor)

            // draw button label
            Draw.text(
                buttonLabels[buttonIndex],
                at: (
                    x: Int32(buttonPositions[buttonIndex].x - 7),
                    y: Int32(buttonPositions[buttonIndex].y - 8)
                ),
                fontSize: 20,
                color: buttonLabelColors[buttonIndex]
            )

            Draw.text(
                "Move player with D-Pad buttons",
                at: (x: 10, y: 10),
                fontSize: 20,
                color: .darkGray
            )
        }
    }

}
