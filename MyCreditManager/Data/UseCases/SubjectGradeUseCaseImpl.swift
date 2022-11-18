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

public final class DefaultSubjectGradeUseCase: SubjectGradeUseCase {
    private let subjectGradesStorage: SubjectGradesStorage
    
    init(subjectGradesStorage: SubjectGradesStorage) {
        self.subjectGradesStorage = subjectGradesStorage
    }
    
    public func get(studentName: String) -> Result<[SubjectGrade], Error> {
        return subjectGradesStorage.get(studentName: studentName)
    }
    
    public func put(_ subjectGrade: SubjectGrade) -> Result<Void, Error> {
        return subjectGradesStorage.put(subjectGrade)
    }
    
    public func delete(studentName: String, subjectName: String) -> Result<Void, Error> {
        return subjectGradesStorage.delete(studentName: studentName, subjectName: subjectName)
    }
}
