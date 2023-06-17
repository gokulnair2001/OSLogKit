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
    
    public func captureLogOnAppear(_ logger: OSLogKit, _ message: String, _ level: OSLogType) -> some View {
        self.modifier(OnAppearOSLog(logger: logger, message: message, level: level))
    }
    
    public func captureBulkLogOnAppear(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType]) -> some View {
        self.modifier(OnAppearBulkOSLog(logger: logger, messages: messages, levels: levels))
    }
    
    public func captureLogOnDisappear(_ logger: OSLogKit, _ message: String, _ level: OSLogType) -> some View {
        self.modifier(OnLongPressOSLog(logger: logger, message: message, level: level))
    }
    
    public func captureBulkLogOnDisappear(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType]) -> some View {
        self.modifier(OnDisappearBulkOSLog(logger: logger, messages: messages, levels: levels))
    }
    
    public func captureLogOnLongPress(_ logger: OSLogKit, _ message: String, _ level: OSLogType) -> some View {
        self.modifier(OnLongPressOSLog(logger: logger, message: message, level: level))
    }
    
    public func captureBulkLogOnLongPress(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType]) -> some View {
        self.modifier(OnLongPressBulkOSLog(logger: logger, messages: messages, levels: levels))
    }
    
    public func captureLogOnTap(_ logger: OSLogKit, _ message: String, _ level: OSLogType) -> some View {
        self.modifier(OnTapOSLog(logger: logger, message: message, level: level))
    }
    
    public func captureBulkLogOnTap(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType]) -> some View {
        self.modifier(OnTapBulkOSLog(logger: logger, messages: messages, levels: levels))
    }
    
    @available(iOS 15.0, *)
    public func captureLogOnSubmit(_ logger: OSLogKit, _ message: String, _ level: OSLogType) -> some View {
        self.modifier(OnSubmitOSLog(logger: logger, message: message, level: level))
    }
    
    @available(iOS 15.0, *)
    public func captureBulkLogOnSubmit(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType]) -> some View {
        self.modifier(OnSubmitBulkOSLog(logger: logger, messages: messages, levels: levels))
    }
    
}

