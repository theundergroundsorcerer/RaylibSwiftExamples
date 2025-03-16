import RaylibSwift

let maxGestureStrings = 20

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

Window.initialize(screenWidth, screenHeight, "raylib [core] example - input gestures")

var touchPosition = Vector2(x: 0, y: 0)
let touchArea = Rectangle(
    x: 220,
    y: 220,
    width: Float(screenWidth) - 230,
    height: Float(screenHeight) - 20
)

var gestureCount = 0

var gestureStrings = [String](repeating: "", count: maxGestureStrings)

var currentGesture = Gesture.none
var lastGesture = Gesture.none

Window.loop(fps: 60) {
    lastGesture = currentGesture
    currentGesture = Gesture.currentDetected
    touchPosition = Touch.position(index: 0)

    if Shapes.isInside(of: touchArea, point: touchPosition) && currentGesture != Gesture.none {
        if currentGesture != lastGesture {
            switch currentGesture {
            case .tap:
                gestureStrings[gestureCount] = "GESTURE TAP"
            case .doubleTap: gestureStrings[gestureCount] = "GESTURE DOUBLETAP"
            case .hold: gestureStrings[gestureCount] = "GESTURE HOLD"
            case .drag: gestureStrings[gestureCount] = "GESTURE DRAG"
            case .swipeRight: gestureStrings[gestureCount] = "GESTURE SWIPE RIGHT"
            case .swipeLeft: gestureStrings[gestureCount] = "GESTURE SWIPE LEFT"
            case .swipeUp: gestureStrings[gestureCount] = "GESTURE SWIPE UP"
            case .swipeDown: gestureStrings[gestureCount] = "GESTURE SWIPE DOWN"
            case .pinchIn: gestureStrings[gestureCount] = "GESTURE PINCH IN"
            case .pinchOut: gestureStrings[gestureCount] = "GESTURE PINCH OUT"
            default: break
            }

            gestureCount += 1

            if gestureCount >= maxGestureStrings {
                for i in 0 ..< maxGestureStrings {
                    gestureStrings[i] = ""
                }

                gestureCount = 0
            }
        }
    }

    Draw.frame {
        Draw.clearBackground(.rayWhite)
        Draw.rectangle(touchArea, color: .gray)
        Draw.text(
            "GESTURES TOUCH AREA",
            at: (x: screenWidth - 270, y: screenHeight - 40),
            fontSize: 20,
            color: Color.fade(.darkGray, alpha: 0.5))  // Todo - fix after implementing color methods

        for i in 0..<gestureCount {
            if i % 2 == 0 {
                Draw.rectangle(
                    at: (x: 10, y: 30 + 20 * Int32(i)),
                    width: 200,
                    height: 20,
                    color: Color.fade(.lightGray, alpha: 0.5))
            } else {
                Draw.rectangle(
                    at: (x: 10, y: 30 + 20 * Int32(i)),
                    width: 200,
                    height: 20,
                    color: Color.fade(.lightGray, alpha: 0.3))
            }

            if(i < gestureCount - 1) {
                Draw.text(
                    gestureStrings[i], 
                    at: (x: 35, y: 36 + 20 * Int32(i) ),
                    fontSize: 10,
                    color: .fade(.gray, alpha: 0.3))
            } else {
                Draw.text(
                    gestureStrings[i], 
                    at: (x: 35, y: 36 + 20 * Int32(i) ),
                    fontSize: 10,
                    color: .red)
            }
        }

        Draw.rectangleLines(
            at: (x: 10, y: 29),
            width: 200,
            height: screenHeight - 50,
            color: .gray)

        if currentGesture != Gesture.none {
            Draw.circle(at: touchPosition, radius: 30, color: .maroon)
        }
    }
}
