//
//  UserDefaultsSubjectGradesStorage.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/18.
//

import Foundation

final class UserDefaultsSubjectGradesStorage {
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init() {
        encoder = JSONEncoder()
        decoder = JSONDecoder()
    }
}

extension UserDefaultsSubjectGradesStorage: SubjectGradesStorage {
    func put(_ subjectGrade: SubjectGrade) -> Result<Void, Error> {
        <#code#>
    }
    
    func get(studentName: String) -> Result<[SubjectGrade], Error> {
        <#code#>
    }
    
    func delete(studentName: String, subjectName: String) -> Result<Void, Error> {
        <#code#>
    }
}
