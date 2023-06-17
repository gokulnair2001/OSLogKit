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
    
    @available(iOS 15.0, *)
    /// Exports the log entries for a specific SubSystem with specific duration
    /// - Parameters:
    ///   - subsystem: Identifier string used while initialising the OSLogKit. If not used Bundle ID of the app is taken into consideration
    ///   - days: Number of days for which the logs need to be exported
    /// - Returns: Array of logs, String format - `[Date] [Category] message`
    func exportLogs(forSubsystem subsystem: String = "", withinDays days: Int = 1) -> [String] {
        
        var logEntries:[String] = []
        var subSystemString = subsystem
        
        if subsystem.isEmpty {
            guard let bundleId = Bundle.main.bundleIdentifier else { return logEntries }
            subSystemString = bundleId
        }
        
        do {
            let store = try OSLogStore(scope: .currentProcessIdentifier)
            let date = Date.now.addingTimeInterval(TimeInterval(-24 * 3600 * days))
            let position = store.position(date: date)

            logEntries = try store
                .getEntries(at: position)
                .compactMap { $0 as? OSLogEntryLog }
                .filter { $0.subsystem == subSystemString }
                .map { "[\($0.date.formatted())] [\($0.category)] \($0.composedMessage)" }
            
        } catch {
            self.logger.warning("OSLogKit export error: \(error.localizedDescription, privacy: .public)")
        }
        
        return logEntries
    }
}
