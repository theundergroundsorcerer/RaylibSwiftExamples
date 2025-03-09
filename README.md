# RaylibExamples

A collection of Swift example applications using [RaylibSwift](https://github.com/theundergroundsorcerer/RaylibSwift), a Swift wrapper for the [Raylib](https://www.raylib.com/) game development library.

These examples are Swift ports of the original C examples found in the [Raylib examples collection](https://github.com/raysan5/raylib/tree/master/examples).

## Examples

The repository includes the following examples:

### Core

- **CoreBasicWindow**: Basic window creation and management  
  *(Equivalent to [core_basic_window.c](https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c))*

- **CoreInputKeys**: Keyboard input detection and handling  
  *(Equivalent to [core_input_keys.c](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c))*

- **CoreInputMouse**: Mouse input and cursor visibility  
  *(Equivalent to [core_input_mouse.c](https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c))*

## Requirements

- Swift 6.0+
- macOS (primary platform) or Linux (has been tested under Ubuntu)

## Building and Running

To build and run an example:

```bash
# Clone the repository
git clone https://github.com/yourusername/RaylibExamples.git
cd RaylibExamples

# Run a specific example
swift run CoreBasicWindow
swift run CoreInputKeys
swift run CoreInputMouse
```

## Creating New Examples

To add a new example:

1. Create a new directory under the appropriate category in the `Sources` directory
2. Add your Swift code with a `main.swift` file
3. Update the `Package.swift` file with a new executable target

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

## License

This project is licensed under the MIT License - see the LICENSE file for details.

The original Raylib examples that these Swift ports are based on are licensed under the zlib/libpng license. See the [Raylib license](https://github.com/raysan5/raylib/blob/master/LICENSE) for details.