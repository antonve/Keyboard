import Cocoa

enum EmitterKeyAction {
    case down
    case up
    case both

    fileprivate var keyDowns: [Bool] {
        switch self {
        case .down:
            return [true]
        case .up:
            return [false]
        case .both:
            return [true, false]
        }
    }
}

enum EmitterMouseButton {
    case left
    case right

    fileprivate var eventParams: (CGEventType, CGEventType, CGMouseButton) {
        switch self {
        case .left:
            return (.leftMouseDown, .leftMouseUp, .left)
        case .right:
            return (.rightMouseDown, .rightMouseUp, .right)
        }
    }
}

protocol EmitterType {
    func setProxy(_ proxy: CGEventTapProxy?)

    func emit(keyCode: KeyCode, flags: CGEventFlags, action: EmitterKeyAction)
    func emit(mouseMoveTo location: CGPoint)
    func emit(mouseClick button: EmitterMouseButton)
    func emit(mouseScroll point: CGPoint)
}

class Emitter: EmitterType {
    struct Const {
        static let pauseInterval: UInt32 = 1000
    }

    private var proxy: CGEventTapProxy?

    func setProxy(_ proxy: CGEventTapProxy?) {
        self.proxy = proxy
    }

    func emit(keyCode: KeyCode, flags: CGEventFlags, action: EmitterKeyAction) {
        var shouldPause = false

        action.keyDowns.forEach {
            if shouldPause {
                pause()
            }
            shouldPause = true

            let e = CGEvent(
                keyboardEventSource: nil,
                virtualKey: keyCode.rawValue,
                keyDown: $0
            )
            e?.flags = flags
            e?.tapPostEvent(proxy)
        }
    }

    func emit(mouseMoveTo location: CGPoint) {
        CGEvent(
            mouseEventSource: nil,
            mouseType: .mouseMoved,
            mouseCursorPosition: location,
            mouseButton: .right
        )?.post(tap: .cghidEventTap)
    }

    func emit(mouseClick button: EmitterMouseButton) {
        guard let voidEvent = CGEvent(source: nil) else { return }

        let (downEventType, upEventType, cgMouseButton) = button.eventParams

        CGEvent(
            mouseEventSource: nil,
            mouseType: downEventType,
            mouseCursorPosition: voidEvent.location,
            mouseButton: cgMouseButton
        )?.post(tap: .cghidEventTap)

        pause()

        CGEvent(
            mouseEventSource: nil,
            mouseType: upEventType,
            mouseCursorPosition: voidEvent.location,
            mouseButton: cgMouseButton
        )?.post(tap: .cghidEventTap)
    }

    func emit(mouseScroll point: CGPoint) {
        CGEvent(
            scrollWheelEvent2Source: nil,
            units: .pixel,
            wheelCount: 2,
            wheel1: Int32(point.y),
            wheel2: Int32(point.x),
            wheel3: 0
        )?.post(tap: .cghidEventTap)
    }

    func pause() {
        // NOTE: it's not possible to post consecutive events
        usleep(Const.pauseInterval)
    }
}
