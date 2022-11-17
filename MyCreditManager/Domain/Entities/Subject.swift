//
//  Subject.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

struct Subject {
    let name: String
}

extension Subject: Identifiable {
    var id: String { name }
}
