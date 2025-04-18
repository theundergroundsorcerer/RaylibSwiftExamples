# RaylibSwiftExamples

A collection of examples demonstrating the use of [RaylibSwift](https://github.com/theundergroundsorcerer/RaylibSwift), a Swift wrapper for the Raylib game development library.

## Examples

### Core Examples

- **CoreBasicWindow**: Demonstrates how to create a basic window using RaylibSwift (core_basic_window)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c)
- **CoreInputKeys**: Shows how to handle keyboard input (core_input_keys)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c)
- **CoreInputMouse**: Illustrates mouse input handling (core_input_mouse)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c)
- **CoreInputMouseWheel**: Demonstrates mouse wheel interaction (core_input_mouse_wheel)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c)
- **CoreInputMultitouch**: Demonstrates handling multitouch input (core_input_multitouch)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_multitouch.c)
- **CoreInputGestures**: Shows how to detect and use touch gestures (core_input_gestures)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_gestures.c)
- **CoreInputVirtualControls**: Illustrates creation of virtual input controls (core_input_virtual_controls)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_virtual_controls.c)

### Shapes Examples

- **ShapesBasicShapes**: Demonstrates drawing basic shapes with RaylibSwift (shapes_basic_shapes)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c)
- **ShapesBouncingBall**: Shows a simple physics simulation with a bouncing ball (shapes_bouncing_ball)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c)
- **ShapesColorsPalette**: Displays a color palette with interactive hover effects (shapes_colors_palette)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c)
- **ShapesLogoRaylib**: Creates the Raylib logo using basic shape primitives (shapes_logo_raylib)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib.c)
- **ShapesLogoRaylibAnim**: Animates the Raylib logo with a multi-stage sequence (shapes_logo_raylib_anim)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib_anim.c)
- **ShapesRectangleScaling**: Interactive rectangle scaling with mouse drag handles (shapes_rectangle_scaling)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_scaling.c)
- **ShapesLinesBezier**: Interactive cubic Bezier curves with draggable control points (shapes_lines_bezier)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_bezier.c)
- **ShapesCollisionArea**: Demonstrates rectangle collision detection with area calculation (shapes_collision_area)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_collision_area.c)
- **ShapesFollowingEyes**: Creates interactive eyes that follow the mouse cursor (shapes_following_eyes)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_following_eyes.c)
- **ShapesEasingsBallAnim**: Shows ball animations using different easing functions (shapes_easings_ball_anim)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_ball_anim.c)
- **ShapesEasingsBoxAnim**: Demonstrates box animations with various easing functions (shapes_easings_box_anim)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_box_anim.c)
- **ShapesEasingsRectangleArray**: Demonstrates easing animations applied to a grid of rectangles (shapes_easings_rectangle_array)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_rectangle_array.c)
- **ShapesDrawRing**: Interactive demo for drawing and customizing ring/circle shapes (shapes_draw_ring)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_ring.c)
- **ShapesDrawSector**: Interactive demo for drawing and customizing circle sectors (shapes_draw_circle_sector)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_circle_sector.c)
- **ShapesDrawRectangleRounded**: Interactive demo for drawing rectangles with rounded corners (shapes_draw_rectangle_rounded)
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_draw_rectangle_rounded.c)

## Getting Started

### Prerequisites
- Swift 6.0 or later
- macOS, Linux, or other platform supported by Swift

### Running Examples
Clone the repository and use Swift package manager to run any example:

```bash
# Clone the repository
git clone https://github.com/yourusername/RaylibSwiftExamples.git
cd RaylibSwiftExamples

# Run a specific example
swift run CoreBasicWindow
swift run CoreInputKeys
swift run CoreInputMouse
swift run CoreInputMouseWheel
```

## Creating New Examples

To add a new example:

1. Create a new directory under the appropriate category in the `Sources` directory
2. Add your Swift code with a `main.swift` file
3. Update the `Package.swift` file with a new executable target
4. Include a link to the original raylib example in your code comments and in the README

## Directory Structure

The examples are organized to mirror the Raylib examples repository structure:

```
Sources/
├── Core/              # Basic window/context and input examples
├── Shapes/            # Drawing basic shapes and primitives
├── Textures/          # Loading and drawing textures
├── Text/              # Font loading and text drawing
├── Models/            # 3D models loading and drawing
├── Shaders/           # Shaders usage examples
├── Audio/             # Audio loading and playing
└── Others/            # Other miscellaneous examples
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

When contributing new examples, please:
1. Follow the naming convention of the original raylib examples
2. Include a link to the corresponding original raylib example
3. Add proper documentation comments

## License

This project is licensed under the MIT License - see the LICENSE file for details.

The original Raylib examples that these Swift ports are based on are licensed under the zlib/libpng license. See the [Raylib license](https://github.com/raysan5/raylib/blob/master/LICENSE) for details.