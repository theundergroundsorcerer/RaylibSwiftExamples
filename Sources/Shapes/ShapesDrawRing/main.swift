// 
// ShapesDrawRing - Demonstrates drawing ring shapes with raylib
//
// This example shows how to draw rings and circle sectors with different parameters.
// You can customize:
//   - Inner and outer radius
//   - Start and end angles
//   - Number of segments
//   - Whether to draw filled or outlined shapes
//
// Original example: https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_ring.c
//

import RaylibSwift

// Initialize window with specified dimensions and title
Window.initialize(width: 800, height: 450, title: "raylib [shapes] example - draw ring")

// Center position for the ring, adjusted to account for UI panel width
let ringCenter = Vector2(
    x: Float( (Window.screenWidth - 300) / 2),
    y: Float(Window.screenHeight / 2))

// Initialize ring parameters
var innerRadius = F(80)
var outerRadius = F(190)
var startAngle = F(0)
var endAngle = F(360)
var segments = F(0)

// Drawing control flags
var drawRing = true
var drawRingLines = false
var drawCircleLines = false

// Main game loop
Window.loop(initialTargetFps: 60) {
    Graphics.draw {
        // Background
        Graphics.clearBackground(.rayWhite)
        
        // Draw UI container elements
        Graphics.drawLine(
            from: (x: 0, y: 500), to: (x: 500, y: Window.screenWidth),
            color: .fade(.lightGray, alpha: 0.6))
        Graphics.drawRectangle(
            topLeft: (x: 500, y: 0), width: Window.screenWidth - 500, height: Window.screenHeight,
            color: .fade(.lightGray, alpha: 0.3))

        // Draw filled ring if enabled
        if drawRing {
            Graphics.drawRing(
                at: ringCenter,
                innerRadius: innerRadius,
                outerRadius: outerRadius,
                startAngle: startAngle,
                endAngle: endAngle,
                color: .fade(.maroon, alpha: 0.3),
                segments: Int32(segments))
        }

        // Draw ring outline if enabled
        if drawRingLines {
            Graphics.drawRingLines(
                at: ringCenter,
                innerRadius: innerRadius,
                outerRadius: outerRadius,
                startAngle: startAngle,
                endAngle: endAngle,
                color: .fade(.black, alpha: 0.4),
                segments: Int32(segments)
            )
        }

        // Draw circle sector outline if enabled
        if drawCircleLines {
            Graphics.drawCircleSectorLines(
                at: ringCenter,
                radius: outerRadius,
                startAngle: startAngle,
                endAngle: endAngle,
                color: .fade(.black, alpha: 0.4),
                segments: Int32(segments))
        }

        // UI Controls - Angles
        Gui.sliderBar(
            bounds: Rectangle(x: 600, y: 40, width: 120, height: 20),
            textLeft: "Start Angle",
            textRight: Text(format: "%.2f", startAngle),
            value: &startAngle,
            minValue: -450,
            maxValue: 450)
        Gui.sliderBar(
            bounds: Rectangle(x: 600, y: 70, width: 120, height: 20),
            textLeft: "End Angle",
            textRight: Text(format: "%.2f", endAngle),
            value: &endAngle,
            minValue: -450,
            maxValue: 450)
            
        // UI Controls - Radius
        Gui.sliderBar(
            bounds: Rectangle(x: 600, y: 140, width: 120, height: 20),
            textLeft: "Inner Radius",
            textRight: Text(format: "%.2f", innerRadius),
            value: &innerRadius,
            minValue: 0,
            maxValue: 180)
        Gui.sliderBar(
            bounds: Rectangle(x: 600, y: 170, width: 120, height: 20),
            textLeft: "Outer Radius",
            textRight: Text(format: "%.2f", outerRadius),
            value: &outerRadius,
            minValue: 0,
            maxValue: 200)
            
        // UI Controls - Segments
        Gui.sliderBar(
            bounds: Rectangle(x: 600, y: 240, width: 120, height: 20),
            textLeft: "Segments",
            textRight: Text(format: "%.2f", segments),
            value: &segments,
            minValue: 0,
            maxValue: 100)

        // UI Controls - Display options
        // Checkbox for toggling ring drawing
        Gui.checkBox(
            bounds: Rectangle(x: 600, y: 320, width: 20, height: 20),
            text: "Draw Ring",
            checked: &drawRing)
        
        // Checkbox for toggling ring outline drawing
        Gui.checkBox(
            bounds: Rectangle(x: 600, y: 350, width: 20, height: 20),
            text: "Draw Ring Lines",
            checked: &drawRingLines)
        
        // Checkbox for toggling circle sector outline drawing
        Gui.checkBox(
            bounds: Rectangle(x: 600, y: 380, width: 20, height: 20),
            text: "Draw Circle Lines", 
            checked: &drawCircleLines)
        
        // Calculate minimum recommended segments based on the angle range
        let minSegments = ( (endAngle - startAngle) / 90).rounded(.up) 
        
        // Determine if we're in manual or auto segment mode
        let isManual = segments > minSegments
        
        // Display the current mode (MANUAL or AUTO)
        Text("MODE: \(isManual ? "MANUAL" : "AUTO")").draw(
            at: (x: 600, y: 270), fontSize: 10, color: isManual ? .maroon : .darkGray)
        
        // Display FPS counter in the top-left corner
        Graphics.drawFps(at: (x: 10, y: 10))
    }
}
