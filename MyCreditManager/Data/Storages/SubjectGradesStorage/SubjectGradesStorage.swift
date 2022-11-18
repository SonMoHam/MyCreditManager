//
//  SubjectGradesStorage.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/18.
//

import Foundation

protocol SubjectGradesStorage {
    func put(_ subjectGrade: SubjectGrade) -> Result<Void, Error>
    func get(studentName: String) -> Result<[SubjectGrade], Error>
    func delete(studentName: String, subjectName: String) -> Result<Void, Error>
}
