//
//  UseCaseProviderImpl.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public final class StubUseCaseProvider: UseCaseProvider {
    public func makeStudentUseCase() -> StudentUseCase {
        return StubStudentUseCase()
    }
    
    public func makeSubjectGradeUseCase() -> SubjectGradeUseCase {
        return StubSubjectGradeUseCaseUseCase()
    }
}

public final class DefaultUseCaseProvider: UseCaseProvider {
    private let studentsStorage: StudentsStorage
    private let subjectGradesStorage: SubjectGradesStorage
    
    init() {
        self.studentsStorage = UserDefaultsStudentsStorage()
        self.subjectGradesStorage = UserDefaultsSubjectGradesStorage()
    }
    
    public func makeStudentUseCase() -> StudentUseCase {
        return DefaultStudentUseCase(studentsStorage: studentsStorage)
    }
    
    public func makeSubjectGradeUseCase() -> SubjectGradeUseCase {
        return DefaultSubjectGradeUseCase(subjectGradesStorage: subjectGradesStorage)
    }
}
