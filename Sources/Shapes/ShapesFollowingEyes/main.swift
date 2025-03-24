import Foundation
import RaylibSwift

@inline(__always)
func moveIris(_ iris: inout Circle, from sclera: Circle, towards destinationPoint: Vector2) {
    guard !Circle(center: sclera.center, radius: irisScleraMaxDistance).contains(destinationPoint)
    else {
        iris.move(to: destinationPoint)
        return
    }

    let destinationDirection = destinationPoint - sclera.center
    let destinationAngle = atan2(destinationDirection.y, destinationDirection.x)
    let displacementFromSclera = Vector2(
        x: irisScleraMaxDistance*cos(destinationAngle),
        y: irisScleraMaxDistance*sin(destinationAngle)
    )
    iris.move(to: sclera.center + displacementFromSclera)
}

Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - following eyes")

let scleraRadius: Float = 80
var leftSclera: Circle = Circle(
    center: (x: Window.screenWidth / 2 - 100, y: Window.screenHeight / 2),
    radius: scleraRadius)
var rightSclera: Circle = Circle(
    center: (x: Window.screenWidth / 2 + 100, y: Window.screenHeight / 2),
    radius: scleraRadius)

let irisRadius: Float = 24
var leftIris: Circle = Circle(center: leftSclera.center, radius: irisRadius)
var rightIris: Circle = Circle(center: rightSclera.center, radius: irisRadius)
var leftLens: Circle = Circle(center: leftIris.center, radius: 10)
var rightLens: Circle = Circle(center: rightIris.center, radius: 10)

let irisScleraMaxDistance = scleraRadius - irisRadius



Window.loop(initialTargetFps: 60) {
    let mousePosition = Mouse.position
    moveIris(&leftIris, from: leftSclera, towards: mousePosition)
    moveIris(&rightIris, from: rightSclera, towards: mousePosition)
    leftLens.move(to: leftIris.center)
    rightLens.move(to: rightIris.center)
 

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        
        leftSclera.draw(color: .lightGray)
        leftIris.draw(color: .brown)
        leftLens.draw(color: .black)

        rightSclera.draw(color: .lightGray)
        rightIris.draw(color: .darkGreen)
        rightLens.draw(color: .black)

        Graphics.drawFps(at: (x: 10, y: 10))
    }
}
