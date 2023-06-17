import OSLog
import SwiftUI


@available(iOS 14.0, *)
@available(macOS 11.0, *)
public class OSLogKit {
    
    private let logger: Logger
    
    // Creates a logger for logging to the default subsystem.
    public init() {
        logger = Logger()
    }
    
    // Creates a logger instance from an existing OSLog object that has the subsystem and category
    public init(subSystem: String, category: String) {
        self.logger = Logger(subsystem: subSystem, category: category)
    }
    
    public func logInfo(msg: String) {
        logger.log("\(msg)")
        logger.debug(<#T##message: OSLogMessage##OSLogMessage#>)
    }
}
