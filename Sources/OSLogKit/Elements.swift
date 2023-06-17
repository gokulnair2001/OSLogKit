//
//  Elements.swift
//  
//
//  Created by Gokul Nair on 17/06/23.
//

import Foundation
import SwiftUI

@available(macOS 11.0, *)
@available(iOS 14.0, *)
extension Text {
    public func defODLog(_ logger: OSLogKit, _ info: String) -> some View {
        self.modifier(OnAppearOSLog(logger: logger, message: info))
    }
}

