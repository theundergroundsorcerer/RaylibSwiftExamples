import RaylibSwift

Window.initialize(
    width: 800, height: 450, title: "raylib [shapes] example - draw rectangle rounded")

var roundness = F(0.2)
var width = F(200)
var height = F(100)
var segments = F(0)
var lineThickness = F(1)

var drawRectangle = false
var drawRoundedLines = true
var drawRoundedRectangle = true

Window.loop(initialTargetFps: 60) {
    let rectangle = Rectangle(
        x: (F(Window.screenWidth) - width - 250) * 0.5,
        y: (F(Window.screenHeight) - height) / 2, width: width, height: height)

    if drawRectangle {
        rectangle.draw(color: .fade(.gold, alpha: 0.6))
    }
    if drawRoundedRectangle {
        rectangle.drawRounded(
            roundness: roundness, color: .fade(.maroon, alpha: 0.2), segments: I(segments))
    }
    if drawRoundedLines {
        rectangle.drawRoundedOutline(roundness: roundness, thickness: lineThickness, 
        color: .fade(.maroon, alpha: 0.4), segments: I(segments))
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        Graphics.drawLine(
            from: (x: 560, y: 0), to: (x: 560, y: Window.screenHeight),
            color: .fade(.lightGray, alpha: 0.6))
        Graphics.drawRectangle(
            topLeft: (x: 560, y: 0), width: Window.screenWidth - 560,
            height: Window.screenHeight - 560, color: .fade(.lightGray, alpha: 0.3))

        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 40, width: 105, height: 20), textLeft: "Width",
            textRight: Text(format: "%.2f", width), value: &width, minValue: 0,
            maxValue: F(Window.screenWidth) - 300)
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 70, width: 105, height: 20), textLeft: "Height",
            textRight: Text(format: "%.2f", width), value: &height,
            minValue: 0, maxValue: F(Window.screenHeight) - 50)
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 140, width: 105, height: 20), textLeft: "Roundness",
            textRight: Text(format: "%.2f", roundness),
            value: &roundness, minValue: 0, maxValue: 1)
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 170, width: 105, height: 20), textLeft: "Thickness",
            textRight: Text(format: "%.2f", lineThickness),
            value: &lineThickness, minValue: 0, maxValue: 20)
        Gui.sliderBar(bounds: Rectangle(x: 640, y: 240, width: 105, height: 20), 
        textLeft: "Segments", textRight: Text(format: "%.2f", segments), value: &segments, minValue: 0, maxValue: 60)

        Gui.checkBox(
            bounds: Rectangle(x: 640, y: 320, width: 20, height: 20),
            text: "Draw Rounded Rectangle", checked: &drawRoundedRectangle)
        Gui.checkBox(
            bounds: Rectangle(x: 640, y: 350, width: 20, height: 20),
            text: "Draw Rounded Lines", checked: &drawRoundedLines)
        Gui.checkBox(
            bounds: Rectangle(x: 640, y: 380, width: 20, height: 20),
            text: "Draw Rectangle", checked: &drawRectangle)

        let isManualMode = segments >= 4
        Text("MODE: \(isManualMode ? "MANUAL" : "AUTO")").draw(
            at: (x: 640, y: 280), fontSize: 10, color: isManualMode ? .maroon : .darkGray)

        Graphics.drawFps(at: (x: 10, y: 10))

    }
}
