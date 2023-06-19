//
//  Errors.swift
//  
//
//  Created by Gokul Nair on 19/06/23.
//

import Foundation

/// OSLogKit uses OSLogError
public enum OSLogError: Error {
    case invalidSubsystem
    case exportFailure(String)
    
    public var errorDescription: String {
        switch self {
        case .exportFailure(let customString):
            return customString
        case .invalidSubsystem:
            return "OSLogKit: Invalid Subsystem"
        }
    }
}
