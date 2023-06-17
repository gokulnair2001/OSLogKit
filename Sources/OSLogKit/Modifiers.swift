//
//  Modifiers.swift
//  
//
//  Created by Gokul Nair on 17/06/23.
//

import Foundation
import SwiftUI
import OSLog


@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnAppearOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
struct OnAppearOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String

    func body(content: Content) -> some View {
        content
            .onAppear {
                logger.logInfo(msg: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnTapOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
struct OnTapOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                logger.logInfo(msg: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 15.0, *)
/// OnSubmitOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
struct OnSubmitOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String

    func body(content: Content) -> some View {
        content
            .onSubmit {
                logger.logInfo(msg: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnDisappearOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
struct OnDisappearOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String

    func body(content: Content) -> some View {
        content
            .onDisappear {
                logger.logInfo(msg: message)
            }
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
/// OnLongPressGestureOSLog
/// logger: A OSLogKit logger instance to capture events
/// message: Message to capture in logger
struct OnLongPressGestureOSLog: ViewModifier {
    var logger: OSLogKit
    var message: String

    func body(content: Content) -> some View {
        content
            .onLongPressGesture {
                logger.logInfo(msg: message)
            }
    }
}


