//
//  StudentUseCaseImpl.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation


public final class StubStudentUseCase: StudentUseCase {
    public func get(name: String) -> Result<Student, Error> {
        let dummyStd = Student(name: name)
        return .success(dummyStd)
    }
    
    public func insert(_ student: Student) -> Result<Void, Error> {
        return .success
    }
    
    public func delete(name: String) -> Result<Void, Error> {
        return .success
    }
}

public final class DefaultStudentUseCase { }
