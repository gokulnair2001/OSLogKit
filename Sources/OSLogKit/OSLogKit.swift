import OSLog
import SwiftUI


@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
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
    
    /// Exports the log entries for a specific SubSystem within the specified time span
    /// - Parameters:
    ///   - subsystem: Identifier string used while initialising the OSLogKit. If not used Bundle ID of the app is taken into consideration
    ///   - span: Duration for which the log needs to be fetched. Logs are available for limited period of time, select span accordingly
    ///   - completion: Block returns array of logs captured if the process succeeds and on failure OSLogKit provides the error.
    ///     Exported Log format - `[[Date] [Category] message]`
    @available(iOS 15.0, *)
    public func exportLogs(forSubsystem subsystem: String = "", timeSpan span: OSLogSpan = .day(1), completion: @escaping((Result<[String], OSLogError>) -> ())) {
        
        var logEntries: [String] = []
        var subSystemString = subsystem
        
        if subsystem.isEmpty {
            guard let bundleId = Bundle.main.bundleIdentifier else {
                completion(.failure(.invalidSubsystem))
                return
            }
            subSystemString = bundleId
        }
        
        do {
            let store = try OSLogStore(scope: .currentProcessIdentifier)
            let date = Date.now.addingTimeInterval(span.getTimeInterval)
            let position = store.position(date: date)
            
            logEntries = try store
                .getEntries(at: position)
                .compactMap { $0 as? OSLogEntryLog }
                .filter { $0.subsystem == subSystemString }
                .map { "[\($0.date.formatted())] [\($0.category)] \($0.composedMessage)" }
            completion(.success(logEntries))
            
        } catch {
            completion(.failure(.exportFailure("OSLogKit export error: \(error.localizedDescription)")))
            self.logger.warning("OSLogKit export error: \(error.localizedDescription, privacy: .public)")
        }
    }
}
