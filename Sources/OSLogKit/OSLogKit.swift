import OSLog
import SwiftUI


@available(iOS 14.0, *)
@available(macOS 11.0, *)
public class OSLogKit {
    
    private let logger: Logger
    
    public init(subSystem: String, category: String) {
        self.logger = Logger(subsystem: "", category: "")
    }
    
    public func logInfo(msg: String) {
        logger.log("\(msg)")
        logger.info("\(msg)")
        logger.warning("\(msg)")
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
struct OnAppearOSLog: ViewModifier {
    var log: OSLogKit
    var msg: String

    func body(content: Content) -> some View {
        content
            .onAppear {
                log.logInfo(msg: msg)
            }
    }
}


@available(macOS 11.0, *)
@available(iOS 14.0, *)
extension Text {
    public func defODLog(logger: OSLogKit, info: String) -> some View {
        self.modifier(OnAppearOSLog(log: logger, msg: info))
    }
}
