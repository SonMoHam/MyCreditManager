//
//  Grade.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public enum Grade: String, CustomStringConvertible {
    case aP
    case a
    case bP
    case b
    case cP
    case c
    case dP
    case d
    case f
    
    init?(_ input: String) {
        let str = input.lowercased().replacingOccurrences(of: "+", with: "P")
        self.init(rawValue: str)
    }
    
    public var description: String {
        return self.rawValue.uppercased().replacingOccurrences(of: "P", with: "+")
    }
    
    public var score: Double {
        switch self {
        case .aP:
            return 4.5
        case .a:
            return 4
        case .bP:
            return 3.5
        case .b:
            return 3
        case .cP:
            return 2.5
        case .c:
            return 2
        case .dP:
            return 1.5
        case .d:
            return 1
        case .f:
            return 0
        }
    }
}
