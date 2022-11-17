//
//  StudentUseCase.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public protocol StudentUseCase {
//    func get() -> Result<[Student], Error>
    func get(name: String) -> Result<Student, Error>
    func insert(_ student: Student) -> Result<Void, Error>
    func delete(name: String) -> Result<Void, Error>
}
