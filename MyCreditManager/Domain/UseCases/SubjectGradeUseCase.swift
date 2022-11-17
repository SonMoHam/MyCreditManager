//
//  SubjectGradeUseCase.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public protocol SubjectGradeUseCase {
//    func get(of studentName: String) -> Result<[SubjectGrade], Error>
    func get(studentName: String) -> Result<[SubjectGrade], Error>
    func put(_ subjectGrade: SubjectGrade) -> Result<Void, Error>
    func delete(studentName: String, subjectName: String) -> Result<Void, Error>
}
