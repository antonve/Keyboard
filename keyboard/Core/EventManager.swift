import Cocoa

final class EventManager {
    var handlers: [EventHandler] = []

    init() {
    }

    func handle(cgEvent: CGEvent) -> Unmanaged<CGEvent>? {
        guard !cgEvent.flags.contains(Emitter.Const.noremapFlag) else {
            cgEvent.flags.remove(Emitter.Const.noremapFlag)
            return Unmanaged.passRetained(cgEvent)
        }
        guard let event = NSEvent(cgEvent: cgEvent) else {
            return Unmanaged.passRetained(cgEvent)
        }
        guard let key = KeyCode(rawValue: event.keyCode) else {
            return Unmanaged.passRetained(cgEvent)
        }

        let flags = event.modifierFlags
        let isKeyDown = (event.type == .keyDown)

//        NSLog("\(String(describing: key)) \(isKeyDown ? "down" : "up")")

        let finalAction: EventHandlerAction = {
            for handler in handlers {
                if let action = handler.handle(key: key, flags: flags, isKeyDown: isKeyDown, isARepeat: event.isARepeat) {
                    return action
                }
            }

            return .passThrough
        }()

        switch finalAction {
        case .prevent:
            return nil
        case .passThrough:
            return Unmanaged.passRetained(cgEvent)
        }
    }

//    private func showOrHideApplication(byBundleIdentifier id: String) {
//        if let app = workspace.frontmostApplication, app.bundleIdentifier == id {
//            app.hide()
//        } else {
//            workspace.launchApplication(
//                withBundleIdentifier: id,
//                options: [],
//                additionalEventParamDescriptor: nil,
//                launchIdentifier: nil
//            )
//        }
//    }
}
