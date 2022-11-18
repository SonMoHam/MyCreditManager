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

public final class DefaultStudentUseCase: StudentUseCase {
  private let studentsStorage: StudentsStorage
    
    init(studentsStorage: StudentsStorage) {
        self.studentsStorage = studentsStorage
    }
    
    public func get(name: String) -> Result<Student, Error> {
        return studentsStorage.read(name)
    }
    
    public func insert(_ student: Student) -> Result<Void, Error> {
        return studentsStorage.create(student)
    }
    
    public func delete(name: String) -> Result<Void, Error> {
        return studentsStorage.delete(name)
    }
}
