import RaylibSwift

Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - draw circle sector")

let center = Vector2(Float(Window.screenWidth - 300) / 2, Float(Window.screenHeight) / 2)
var outerRadius = F(180)
var startAngle = F(0)
var endAngle = F(180)
var segments = F(0)
var minSegments = F(4)

Window.loop(initialTargetFps: 60) {
    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
    }

    Graphics.drawLine(
        from: (x: 500, y: 0), to: (x: 500, y: Window.screenHeight),
        color: .fade(.darkGray, alpha: 0.6))
    Graphics.drawRectangle(
        topLeft: (x: 500, y: 0), width: Window.screenWidth - 500, height: Window.screenHeight,
        color: .fade(.lightGray, alpha: 0.3))

    Graphics.drawCircleSector(
        at: center, radius: outerRadius, startAngle: startAngle, endAngle: endAngle,
        color: .fade(.maroon, alpha: 0.3), segments: Int32(segments))
    Graphics.drawCircleSectorLines(
        at: center, radius: outerRadius, startAngle: startAngle, endAngle: endAngle,
        color: .fade(.maroon, alpha: 0.6), segments: Int32(segments))
    
    
}
