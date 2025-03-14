import RaylibSwift

let maxGestureStrings = 20

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "raylib [core] example - input gestures")

let touchPosition = Vector2(x: 0, y: 0)
let touchArea = Rectangle(
    x: 220, 
    y: 220, 
    width: Float(screenWidth) - 230, 
    height: Float(screenHeight) - 20
)

var gestureCount = 0 as Int32

var gestureStrings = [String]()
gestureStrings.reserveCapacity(maxGestureStrings)

var currentGesture = Input.Gestures.Gesture.none
var lastGesture = Input.Gestures.Gesture.none