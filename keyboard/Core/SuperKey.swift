import Foundation

final class SuperKey {
    let hookedKey: KeyCode

    enum State {
        case inactive
        case activated
        case enabled
        case disabled
    }

    private let downThreshold: Double = 50 // ms
    private let dispatchDelay: Int = 150 // ms
    private var activatedAt: Double = 0

    private var handledAction: DispatchWorkItem?
    private var handledKey: KeyCode?
    private var handledAt: DispatchTime?

    var state: State = .inactive {
        didSet {
            guard state != oldValue else {
                return
            }

            if state == .activated {
                activatedAt = DispatchTime.uptimeNanoseconds()
            }

            NSLog("state = %@", String(describing: state))
        }
    }

    init(key: KeyCode) {
        hookedKey = key
    }

    func enable() -> Bool {
        guard DispatchTime.uptimeNanoseconds() - activatedAt > downThreshold * 1e6 else {
            return false
        }
        state = .enabled
        return true
    }

    func async(key: KeyCode, execute block: @escaping @convention(block) () -> Void) {
        let dispatchTime: DispatchTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(dispatchDelay)
        let work = DispatchWorkItem(block: block)

        handledKey = key
        handledAction = work
        handledAt = dispatchTime

        DispatchQueue.global().asyncAfter(deadline: dispatchTime, execute: work)
    }

    func cancel() -> KeyCode? {
        guard let handledAction = handledAction,
            let handledKey = handledKey,
            let handledAt = handledAt else {
            return nil
        }
        self.handledAction = nil
        self.handledKey = nil
        self.handledAt = nil

        guard handledAt > DispatchTime.now() else {
            return nil
        }

        handledAction.cancel()

        return handledKey
    }
}
