//
//  Elements.swift
//  
//
//  Created by Gokul Nair on 17/06/23.
//

import Foundation
import SwiftUI
import OSLog

@available(macOS 11.0, *)
@available(iOS 14.0, *)
extension View {
    
    /// Captures logs on appearance of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - message: Interpolated string which needs to be logged
    ///   - level: Specific level on which log needs to be captured
    /// - Returns: some View
    public func captureLogOnAppear(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnAppearOSLog(logger: logger, message: message, level: level, action: perform))
    }
    
    /// Captures bulk logs on appearance of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - messages: Interpolated strings which needs to be logged
    ///   - levels: Specific levels on which log needs to be captured
    /// - Returns: some View
    public func captureBulkLogOnAppear(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType], _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnAppearBulkOSLog(logger: logger, messages: messages, levels: levels, action: perform))
    }
    
    /// Captures logs on disapperance of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - message: Interpolated string which needs to be logged
    ///   - level: Specific level on which log needs to be captured
    /// - Returns: some View
    public func captureLogOnDisappear(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnLongPressOSLog(logger: logger, message: message, level: level, action: perform))
    }
    
    /// Captures bulk logs on disapperance of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - messages: Interpolated strings which needs to be logged
    ///   - levels: Specific levels on which log needs to be captured
    /// - Returns: some View
    public func captureBulkLogOnDisappear(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType], _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnDisappearBulkOSLog(logger: logger, messages: messages, levels: levels, action: perform))
    }
    
    /// Captures logs on long press of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - message: Interpolated string which needs to be logged
    ///   - level: Specific level on which log needs to be captured
    /// - Returns: some View
    public func captureLogOnLongPress(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnLongPressOSLog(logger: logger, message: message, level: level, action: perform))
    }
    
    /// Captures bulk logs on long press of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - messages: Interpolated strings which needs to be logged
    ///   - levels: Specific levels on which log needs to be captured
    /// - Returns: some View
    public func captureBulkLogOnLongPress(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType], _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnLongPressBulkOSLog(logger: logger, messages: messages, levels: levels, action: perform))
    }
    
    /// Captures logs on tap of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - message: Interpolated string which needs to be logged
    ///   - level: Specific level on which log needs to be captured
    /// - Returns: some View
    public func captureLogOnTap(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnTapOSLog(logger: logger, message: message, level: level, action: perform))
    }
    
    /// Captures bulk logs on tap of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - messages: Interpolated strings which needs to be logged
    ///   - levels: Specific levels on which log needs to be captured
    /// - Returns: some View
    public func captureBulkLogOnTap(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType], _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnTapBulkOSLog(logger: logger, messages: messages, levels: levels, action: perform))
    }
    
    /// Captures logs on submit of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - message: Interpolated string which needs to be logged
    ///   - level: Specific level on which log needs to be captured
    /// - Returns: some View
    @available(iOS 15.0, *)
    public func captureLogOnSubmit(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnSubmitOSLog(logger: logger, message: message, level: level, action: perform))
    }
    
    /// Captures bulk logs on submit of a view with specific log level
    /// - Parameters:
    ///   - logger: A logger instance which captures the logs
    ///   - messages: Interpolated strings which needs to be logged
    ///   - levels: Specific levels on which log needs to be captured
    /// - Returns: some View
    @available(iOS 15.0, *)
    public func captureBulkLogOnSubmit(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType], _ perform: (() -> Void)? = nil) -> some View {
        self.modifier(OnSubmitBulkOSLog(logger: logger, messages: messages, levels: levels, action: perform))
    }
    
}

