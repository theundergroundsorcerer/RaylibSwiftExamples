# RaylibSwiftExamples

A collection of examples demonstrating the use of [RaylibSwift](https://github.com/theundergroundsorcerer/RaylibSwift), a Swift wrapper for the Raylib game development library.

## Examples

### Core Examples

- **CoreBasicWindow**: Demonstrates how to create a basic window using RaylibSwift
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c)
- **CoreInputKeys**: Shows how to handle keyboard input
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c)
- **CoreInputMouse**: Illustrates mouse input handling
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c)
- **CoreInputMouseWheel**: Demonstrates mouse wheel interaction
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c)
- **CoreInputGamepad**: Shows how to detect and use gamepad input
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_gamepad.c)
- **CoreInputMultitouch**: Demonstrates handling multitouch input
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_multitouch.c)
- **CoreInputGestures**: Shows how to detect and use touch gestures
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_gestures.c)
- **CoreInputVirtualControls**: Illustrates creation of virtual input controls
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_virtual_controls.c)

### Shapes Examples

- **ShapesBasicShapes**: Demonstrates drawing basic shapes with RaylibSwift
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c)
- **ShapesBouncingBall**: Shows a simple physics simulation with a bouncing ball
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bouncing_ball.c)
- **ShapesColorsPalette**: Displays a color palette with interactive hover effects
  - [Original raylib example](https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_colors_palette.c)

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