import RaylibSwift

Window.initialize(width: 800, height: 450, title: "raylib [shapes] examples - easings ball anim")

enum BallState: Int, CaseIterable {
    case move = 0
    case increaseSize = 1
    case changeAlpha = 2
    case reset = 3

    var next: BallState {
        switch self {
        case .move:
            .increaseSize
        case .increaseSize:
            .changeAlpha
        case .changeAlpha:
            .reset
        case .reset:
            .move
        }
    }
}

var framesCounter: Int = 0
var ball: Circle = Circle(center: (x: -100, y: 200), radius: 20)
var ballAlpha: Float = 0
var ballState: BallState = .move

Window.loop(initialTargetFps: 60) {
    // Update animation based on ballState
    switch ballState {
    case .move:
        framesCounter += 1
        ball.move(
            to: Vector2(
                x: Ease.elasticOut(
                    from: -100,
                    to: Float(Window.screenWidth / 2 + 100),
                    progress: Progress(time: Float(framesCounter), duration: 120)),
                y: ball.center.y))
        if framesCounter >= 120 {
            framesCounter = 0
            ballState = ballState.next
        }

    case .increaseSize:
        framesCounter += 1
        ball.resize(
            radius: Ease.elasticIn(
                from: 20,
                to: 500,
                progress: Progress(time: Float(framesCounter), duration: 200)))
        if framesCounter >= 200 {
            framesCounter = 0
            ballState = ballState.next
        }

    case .changeAlpha:
        framesCounter += 1
        ballAlpha = Ease.cubicOut(
            from: 0, to: 1,
            progress: Progress(time: Float(framesCounter), duration: 200))
        if framesCounter >= 200 {
            framesCounter = 0
            ballState = ballState.next
        }
    case .reset:
        if Keyboard.isPressed(key: .enter) {
            ball.move(to: Vector2(-100, ball.center.y))
            ball.resize(radius: 20)
            ballAlpha = 0
            ballState = .move
        }
    }

    if Keyboard.isPressed(key: .r) {
        framesCounter = 0
    }

    Graphics.draw {
        Graphics.clearBackground(.rayWhite)
        if ballState.rawValue >= 2 {
            Graphics.drawRectangle(
                topLeft: (x: 0, y: 0), 
                width: Window.screenWidth, 
                height: Window.screenHeight, 
                color: .green)
        }
        ball.draw(color: .fade(.red, alpha: 1.0 - ballAlpha))

        if ballState.rawValue == 3 {
            Text("PRESS [ENTER] TO PLAY AGAIN!").draw(
                at: (x: 240, y: 200), 
                fontSize: 20, 
                color: .black)
        }
    }
}
