//
//  UseCaseProvider.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public protocol UseCaseProvider {
    func makeStudentUseCase() -> StudentUseCase
    func makeSubjectGradeUseCase() -> SubjectGradeUseCase
}
