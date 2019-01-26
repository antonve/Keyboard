import Cocoa

// Switch to EISUU with Escape key
final class EscapeHandler: Handler {
    private let emitter: EmitterType

    init(emitter: EmitterType) {
        self.emitter = emitter
    }

    func handle(keyEvent: KeyEvent) -> HandlerAction? {
        guard keyEvent.isDown else {
            return nil
        }
        guard keyEvent.match(code: .escape) else {
            return nil
        }

        emitter.emit(code: .jisEisu)

        return .passThrough
    }
}
