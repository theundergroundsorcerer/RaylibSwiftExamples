/**
 * ShapesBasicShapes - Basic Shapes Drawing
 *
 * This example demonstrates how to draw basic shapes in RaylibSwift.
 * It shows how to create and render lines, circles, rectangles, polygons and more.
 *
 * Based on the raylib "shapes_basic_shapes" example:
 * https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c
 */

import RaylibSwift


Window.initialize(
    width: 800, 
    height: 450, 
    title: "raylib [shapes] example - basic shapes drawing")

var rotation = F(0)

Window.loop(initialTargetFps: 60) {
    rotation += 72 * Time.lastFrameDuration

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        Graphics.drawFps(at: (x: 10, y: 10))

        Graphics.drawText(
            "Some basic shapes available on raylib",
            at: (x: 20, 20),
            fontSize: 20,
            color: .darkGray)

        // Circle shapes and lines
        Graphics.drawCircle(at: (x: Window.screenWidth / 5, y: 120), radius: 35, color: .darkBlue)
        Graphics.drawCircleGradient(
            at: (x: Window.screenWidth / 5, y: 220),
            radius: 60,
            innerColor: .green,
            outerColor: .skyBlue)
        Graphics.drawCircleLines(
            at: (x: Window.screenWidth / 5, 340),
            radius: 80,
            color: .darkBlue)

        // Rectangle shapes and lines
        Graphics.drawRectangle(
            topLeft: (x: Window.screenWidth / 2 - 60, y: 100),
            width: 120,
            height: 60,
            color: .red)
        Graphics.drawRectangleGradient(
            topLeft: (x: Window.screenWidth / 2 - 90, y: 170),
            width: 180,
            height: 130,
            leftColor: .maroon,
            rightColor: .gold)
        Graphics.drawRectangleLines(
            topLeft: (x: Window.screenWidth / 2 - 40, 320),
            width: 80,
            height: 60,
            color: .orange)

        // Triangle shapes and lines
        Graphics.drawTriangle(
            vertex1: Vector2(F(Window.screenWidth) / 4 * 3, 80),
            vertex2: Vector2(F(Window.screenWidth) / 4 * 3 - 60, 150),
            vertex3: Vector2(F(Window.screenWidth) / 4 * 3 + 60, 150),
            color: .darkBlue)
        Graphics.drawTriangleLines(
            vertex1: Vector2(F(Window.screenWidth) / 4 * 3, 160),
            vertex2: Vector2(F(Window.screenWidth) / 4 * 3 - 20, 230),
            vertex3: Vector2(F(Window.screenWidth) / 4 * 3 + 20, 230),
            color: .violet)

        // Draw shapes and lines
        Graphics.drawPolygon(
            center: Vector2(F(Window.screenWidth / 4 * 3), 330),
            numberOfSides: 6,
            radius: 80,
            rotation: rotation,
            color: .brown)
        Graphics.drawPolygonLines(
            center: Vector2(F(Window.screenWidth) / 4 * 3, 330),
            numberOfSides: 6, 
            radius: 90, 
            rotation: rotation, 
            color: .brown)
        Graphics.drawPolygonLines(
            center: Vector2(F(Window.screenWidth) / 4 * 3, 330),
            numberOfSides: 6, 
            radius: 85,
            rotation: rotation, 
            thickness: 20, 
            color: .beige)
        
        Graphics.drawLine(
            from: (x: 18, y: 42), 
            to: (x: Window.screenWidth - 18, y: Window.screenHeight - 42),
            color: .black)
    }
}
