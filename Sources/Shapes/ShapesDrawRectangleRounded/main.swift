// 
// ShapesDrawRectangleRounded - Demonstrates drawing rounded rectangles with raylib
//
// This example shows how to draw rectangles with rounded corners using different parameters.
// You can customize:
//   - Width and height 
//   - Roundness (corner radius as a proportion of rectangle size)
//   - Line thickness for outlines
//   - Number of segments for the corners
//
// Original example: https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_rectangle_rounded.c
//

import RaylibSwift

// Initialize window with specified dimensions and title
Window.initialize(
    width: 800, height: 450, title: "raylib [shapes] example - draw rectangle rounded")

// Initialize rectangle parameters
var roundness = F(0.2)
var width = F(200)
var height = F(100)
var segments = F(0)
var lineThickness = F(1)

// Drawing control flags
var drawRectangle = false
var drawRoundedLines = true
var drawRoundedRectangle = true

// Main game loop
Window.loop(initialTargetFps: 60) {
    // Create rectangle with specified parameters
    let rectangle = Rectangle(
        x: (F(Window.screenWidth) - width - 250) * 0.5,
        y: (F(Window.screenHeight) - height) / 2, width: width, height: height)

    // Draw regular rectangle if enabled
    if drawRectangle {
        rectangle.draw(color: .fade(.gold, alpha: 0.6))
    }
    // Draw rounded rectangle if enabled
    if drawRoundedRectangle {
        rectangle.drawRounded(
            roundness: roundness, color: .fade(.maroon, alpha: 0.2), segments: I(segments))
    }
    // Draw rounded rectangle outline if enabled
    if drawRoundedLines {
        rectangle.drawRoundedOutline(roundness: roundness, thickness: lineThickness, 
        color: .fade(.maroon, alpha: 0.4), segments: I(segments))
    }

    Graphics.draw {
        // Clear the background with rayWhite color
        Graphics.clearBackground(.rayWhite)
        // Draw a vertical line as a separator
        Graphics.drawLine(
            from: (x: 560, y: 0), to: (x: 560, y: Window.screenHeight),
            color: .fade(.lightGray, alpha: 0.6))
        // Draw a rectangle for the UI background
        Graphics.drawRectangle(
            topLeft: (x: 560, y: 0), width: Window.screenWidth - 560,
            height: Window.screenHeight - 560, color: .fade(.lightGray, alpha: 0.3))

        // Slider to adjust rectangle width
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 40, width: 105, height: 20), textLeft: "Width",
            textRight: Text(format: "%.2f", width), value: &width, minValue: 0,
            maxValue: F(Window.screenWidth) - 300)
        // Slider to adjust rectangle height
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 70, width: 105, height: 20), textLeft: "Height",
            textRight: Text(format: "%.2f", width), value: &height,
            minValue: 0, maxValue: F(Window.screenHeight) - 50)
        // Slider to adjust roundness of corners
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 140, width: 105, height: 20), textLeft: "Roundness",
            textRight: Text(format: "%.2f", roundness),
            value: &roundness, minValue: 0, maxValue: 1)
        // Slider to adjust line thickness for outlines
        Gui.sliderBar(
            bounds: Rectangle(x: 640, y: 170, width: 105, height: 20), textLeft: "Thickness",
            textRight: Text(format: "%.2f", lineThickness),
            value: &lineThickness, minValue: 0, maxValue: 20)
        // Slider to adjust number of segments for rounded corners
        Gui.sliderBar(bounds: Rectangle(x: 640, y: 240, width: 105, height: 20), 
        textLeft: "Segments", textRight: Text(format: "%.2f", segments), value: &segments, minValue: 0, maxValue: 60)

        // Checkbox to toggle drawing rounded rectangle
        Gui.checkBox(
            bounds: Rectangle(x: 640, y: 320, width: 20, height: 20),
            text: "Draw Rounded Rectangle", checked: &drawRoundedRectangle)
        // Checkbox to toggle drawing rounded rectangle outline
        Gui.checkBox(
            bounds: Rectangle(x: 640, y: 350, width: 20, height: 20),
            text: "Draw Rounded Lines", checked: &drawRoundedLines)
        // Checkbox to toggle drawing regular rectangle
        Gui.checkBox(
            bounds: Rectangle(x: 640, y: 380, width: 20, height: 20),
            text: "Draw Rectangle", checked: &drawRectangle)

        // Display mode based on number of segments
        let isManualMode = segments >= 4
        Text("MODE: \(isManualMode ? "MANUAL" : "AUTO")").draw(
            at: (x: 640, y: 280), fontSize: 10, color: isManualMode ? .maroon : .darkGray)

        // Draw FPS counter
        Graphics.drawFps(at: (x: 10, y: 10))

    }
}
