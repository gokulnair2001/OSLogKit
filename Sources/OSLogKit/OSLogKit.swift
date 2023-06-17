import OSLog
import SwiftUI


@available(iOS 14.0, *)
@available(macOS 11.0, *)
public class OSLogKit {
    
    // Classic Logger instance which sources all loggings
    let logger: Logger
    
    /// Creates a logger for logging to the default subsystem.
    public init() {
        logger = Logger()
    }
    
    /// Creates a logger instance from an existing OSLog object that has the subsystem and category
    /// - Parameters:
    ///   - subSystem: An identifier string, in reverse DNS notation, that represents the app subsystem that’s logging information, such as com.your_company.your_subsystem_name.
    ///   - category: A category within the specified subsystem. The system uses this value to categorize and filter related log messages, and to group related logging settings within the subsystem.
    public init(subSystem: String, category: String) {
        self.logger = Logger(subsystem: subSystem, category: category)
    }
    
    
    /// Writes a message to the log using the specified log type
    /// - Parameters:
    ///   - level: Specifies the level on which the log needs to be captured (https://developer.apple.com/documentation/os/oslogtype)
    ///   - message: The interpolated string that the logger writes to the log
    public func capture(level: OSLogType? = nil, message: String) {
        
        guard let level else {
            logger.log("\(message)")
            return
        }
        
        logger.log(level: level, "\(message)")
    }
    
    
    /// Writes a bulk of message to the log using the specified log type
    /// - Parameters:
    ///   - levels: Specifies the levels on which the logs needs to be captured (https://developer.apple.com/documentation/os/oslogtype)
    ///   - messages: The interpolated strings that the logger writes to the log
    public func captureInBulk(levels: [OSLogType] = [], messages: [String]) {
        
        if levels.isEmpty {
            messages.forEach { message in
                self.logger.log("\(message)")
            }
        } else {
            for (level, message) in zip(levels, messages) {
                logger.log(level: level, "\(message)")
            }
        }
        
    }
}
