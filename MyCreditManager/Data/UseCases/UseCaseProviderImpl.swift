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

public final class DefaultUseCaseProvider { }
