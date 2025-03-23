/**
 * CoreInputVirtualControls - Virtual Controls
 * 
 * This example demonstrates how to create and use virtual controls like buttons and joysticks
 * for touch interfaces in RaylibSwift.
 *
 * Based on the raylib "core_input_virtual_controls" example:
 * https://github.com/raysan5/raylib/blob/master/examples/core/core_input_virtual_controls.c
 */

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

Window.initialize(
    width: screenWidth, 
    height: screeHeight, 
    title: "raylib [core] example - input virtual controls")

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

Window.loop(initialTargetFps: 60) {
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

    let deltaTime = Time.lastFrameDuration
    switch pressedButton {
    case .up: playerPosition.y -= playerSpeed * deltaTime
    case .left: playerPosition.x -= playerSpeed * deltaTime
    case .right: playerPosition.x += playerSpeed * deltaTime
    case .down: playerPosition.y += playerSpeed * deltaTime
    default: break
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)

        // Draw player position
        Circle(center: playerPosition, radius: 50).draw(color: .maroon)

        // Draw GUI
        for i in 0..<PadButton.max {
            let buttonIndex = Int(i)
            // get button color
            let buttonColor: Color = pressedButton.rawValue == i ? .darkGray : .black

            // draw button
            let button = Circle(center: buttonPositions[buttonIndex], radius: buttonRadius)
            button.draw(color: buttonColor)

            // draw button label
            Graphics.drawText (
                buttonLabels[buttonIndex],
                at: (
                    x: Int32(buttonPositions[buttonIndex].x - 7),
                    y: Int32(buttonPositions[buttonIndex].y - 8)
                ),
                fontSize: 20,
                color: buttonLabelColors[buttonIndex]
            )

            Graphics.drawText (
                "Move player with D-Pad buttons",
                at: (x: 10, y: 10),
                fontSize: 20,
                color: .darkGray
            )
        }
    }

}
