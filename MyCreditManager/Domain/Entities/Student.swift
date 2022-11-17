//
//  Student.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

struct Student {
    let name: String
}

extension Student: Identifiable {
    var id: String { name }
}
