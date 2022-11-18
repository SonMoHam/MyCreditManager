//
//  Student.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public struct Student {
    let name: String
}

extension Student: Identifiable, Hashable, Codable {
    public var id: String { name }
}
