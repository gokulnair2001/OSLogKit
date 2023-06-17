//
//  Modifiers.swift
//  
//
//  Created by Gokul Nair on 17/06/23.
//

import Foundation
import SwiftUI
import OSLog


// MARK: -  OnAppear Modifier

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnAppearOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnAppearOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                logger.capture(level: level, message: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnAppearBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnAppearBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: - OnTapGesture Modifiers

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnTapOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnTapOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                logger.capture(level: level, message: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnTapBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnTapBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: -  OnSubmit modifiers

@available(macOS 11.0, *)
@available(iOS 15.0, *)
/// OnSubmitOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnSubmitOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    
    func body(content: Content) -> some View {
        content
            .onSubmit {
                logger.capture(level: level, message: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 15.0, *)
/// OnSubmitBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnSubmitBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    
    func body(content: Content) -> some View {
        content
            .onSubmit {
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: - OnDisappear modifier

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnDisappearOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnDisappearOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    
    func body(content: Content) -> some View {
        content
            .onDisappear {
                logger.capture(level: level, message: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnDisappearBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnDisappearBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    
    func body(content: Content) -> some View {
        content
            .onDisappear {
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: -  OnLongPressGesture Modifiers

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnLongPressOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnLongPressOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    
    func body(content: Content) -> some View {
        content
            .onLongPressGesture {
                logger.capture(level: level, message: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnLongPressBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnLongPressBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    
    func body(content: Content) -> some View {
        content
            .onLongPressGesture {
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}
