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

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnAppearOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnAppearOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                action?()
                logger.capture(level: level, message: message)
            })
    }
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnAppearBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnAppearBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                action?()
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: - OnTapGesture Modifiers

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnTapOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnTapOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                action?()
                logger.capture(level: level, message: message)
            }
    }
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnTapBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnTapBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                action?()
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: -  OnSubmit modifiers

@available(iOS 15.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnSubmitOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnSubmitOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onSubmit {
                action?()
                logger.capture(level: level, message: message)
            }
    }
}

@available(iOS 15.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnSubmitBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnSubmitBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onSubmit {
                action?()
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: - OnDisappear modifier

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnDisappearOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnDisappearOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onDisappear {
                action?()
                logger.capture(level: level, message: message)
            }
    }
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnDisappearBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnDisappearBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onDisappear {
                action?()
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}

// MARK: -  OnLongPressGesture Modifiers

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnLongPressOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
/// level: Specifies the level on which log is to be made
struct OnLongPressOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String
    var level: OSLogType? = nil
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onLongPressGesture {
                action?()
                logger.capture(level: level, message: message)
            }
    }
}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(xrOS 1.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
/// OnLongPressBulkOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Messages to capture in logger
/// levels: Level specification for each logging
struct OnLongPressBulkOSLog: ViewModifier {
    var logger: OSLogKit
    var messages: [String]
    var levels: [OSLogType] = []
    var action: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        content
            .onLongPressGesture {
                action?()
                logger.captureInBulk(levels: levels, messages: messages)
            }
    }
}
