import Cocoa
import InputMethodKit

// Input Method switching
//
//     Ctrl-; Select next source in Input menu
//
final class InputMethodHandler: Handler {
    private let emitter: EmitterType
    private let inputSources: [TISInputSource]

    init(emitter: EmitterType) {
        self.emitter = emitter

        let inputSourceNSArray = TISCreateInputSourceList(nil, false).takeRetainedValue() as NSArray
        let inputSourceList = inputSourceNSArray as! [TISInputSource]
        self.inputSources = inputSourceList.filter { $0.isKeyboardInputSource && $0.isSelectable }
    }

    func handle(keyEvent: KeyEvent) -> HandlerAction? {
        guard keyEvent.isDown else { return nil }
        guard !keyEvent.isARepeat else { return nil }
        guard keyEvent.match(code: .semicolon, control: true) else { return nil }

        changeInput()
        return .prevent
    }

    func handleSuperKey(prefix: KeyCode, keys: Set<KeyCode>) -> Bool {
        return false
    }

    private func changeInput() {
        guard let i = inputSources.firstIndex(where: { $0.isSelected }) else { return }

        let current = inputSources[i]
        let next = inputSources[(i + 1) % inputSources.count]

        if current.isCJKV, let nonCJKV = inputSources.first(where: { !$0.isCJKV }) {
            // Workaround for TIS CJKV layout bug:
            // when it's CJKV, select nonCJKV input first and then return
            TISSelectInputSource(nonCJKV)
        }

        TISSelectInputSource(next)
    }
}
