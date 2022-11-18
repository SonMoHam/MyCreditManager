//
//  StudentsStorage.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/18.
//

import Foundation

protocol StudentsStorage {
    func create(_ student: Student) -> Result<Void, Error>
    func read(_ name: String) -> Result<Student, Error>
    func delete(_ name: String) -> Result<Void, Error>
}
