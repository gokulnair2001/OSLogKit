//
//  OSLogSpan.swift
//  
//
//  Created by Gokul Nair on 19/06/23.
//

import Foundation

/// OSLogKit uses OSLogSpan to calculate the duration for which the log needs to be fetched
public enum OSLogSpan {
    case minute(Int)
    case hour(Int)
    case day(Int)
    
    var getTimeInterval: TimeInterval {
        switch self {
        case .minute(let minutes):
            return TimeInterval(-60 * minutes)
        case .hour(let hours):
            return TimeInterval(-3600 * hours)
        case .day(let days):
            return TimeInterval(-24 * 3600 * days)
        }
    }
}
