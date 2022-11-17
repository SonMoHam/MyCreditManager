//
//  Subject.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public struct Subject {
    let name: String
}

extension Subject: Identifiable, Equatable {
    public var id: String { name }
}
