// 
// ShapesDrawSector - Demonstrates drawing circle sectors with raylib
//
// This example shows how to draw circle sectors with different parameters.
// You can customize:
//   - Outer radius
//   - Start and end angles
//   - Number of segments
//
// Original example: https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_circle_sector.c
//

import Foundation
import RaylibSwift

// Initialize window with specified dimensions and title
Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - draw circle sector")

// Center position for the sector, adjusted to account for UI panel width
let center = Vector2(Float(Window.screenWidth - 300) / 2, Float(Window.screenHeight) / 2)

// Initialize sector parameters
var outerRadius = F(180)
var startAngle = F(0)
var endAngle = F(180)
var segments = F(10)
var minSegments = F(4)

// Main game loop
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

    Gui.sliderBar(
        bounds: Rectangle(x: 600, y: 40, width: 120, height: 20), textLeft: "Start Angle",
        textRight: Text(format: "%.2f", startAngle), value: &startAngle, minValue: 0, maxValue: 720)
    Gui.sliderBar(
        bounds: Rectangle(x: 600, y: 70, width: 120, height: 20), textLeft: "End Angle",
        textRight: Text(format: "%.2f", endAngle), value: &endAngle, minValue: 0, maxValue: 720)

    Gui.sliderBar(
        bounds: Rectangle(x: 600, y: 140, width: 120, height: 20), textLeft: "Outer Radius",
        textRight: Text(format: "%.2f", outerRadius), value: &outerRadius, minValue: 0,
        maxValue: 200)
    Gui.sliderBar(
        bounds: Rectangle(x: 600, y: 170, width: 120, height: 20), textLeft: "Segments",
        textRight: Text(format: "%.2f", segments), value: &segments, minValue: 0, maxValue: 100)

    minSegments = trunc(ceil(endAngle - startAngle) / 90)
    let isManual = segments >= minSegments
    Text("MODE: \(isManual ? "MANUAL" : "AUTO")").draw(
        at: (x: 600, y: 200), fontSize: 10, color: isManual ? .maroon : .darkGray)
    Graphics.drawFps(at: (x: 10, y: 10))
}
