//
//  OSLogError.swift
//  
//
//  Created by Gokul Nair on 19/06/23.
//

import Foundation

/// OSLogKit uses OSLogError to throw correct error for various failures
public enum OSLogError: Error {
    case invalidSubsystem
    case exportFailure(String)
    
    // Detailed description about the error
    public var errorDescription: String {
        switch self {
        case .exportFailure(let customString):
            return customString
        case .invalidSubsystem:
            return "OSLogKit: Invalid Subsystem"
        }
    }
}
