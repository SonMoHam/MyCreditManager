//
//  SubjectGradeUseCaseImpl.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public final class StubSubjectGradeUseCaseUseCase: SubjectGradeUseCase {
    public func get(studentName: String) -> Result<[SubjectGrade], Error> {
        return .success([])
    }
    
    public func put(_ subjectGrade: SubjectGrade) -> Result<Void, Error> {
        return .success
    }
    
    public func delete(studentName: String, subjectName: String) -> Result<Void, Error> {
        return .success
    }
}

public final class DefaultSubjectGradeUseCaseUseCase { }
