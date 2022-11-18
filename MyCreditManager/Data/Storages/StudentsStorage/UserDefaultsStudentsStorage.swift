//
//  UserDefaultsStudentsStorage.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/18.
//

import Foundation

enum stubError: Error {
    case stub
}

final class UserDefaultsStudentsStorage{
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init() {
        encoder = JSONEncoder()
        decoder = JSONDecoder()
    }
    
    private func search(_ name: String) -> Student? {
        let students = fetchStudents()
        return students.filter { $0.name == name }.first
    }
    
    private func fetchStudents() -> [Student] {
        guard let data = UserDefaults.StudentManage.object(forKey: .students) as? Data,
              let students = try? decoder.decode([Student].self, from: data)
        else { return [] }
        return students
    }
    
    private func update(_ students: [Student]) {
        let encoded = try? encoder.encode(students)
        UserDefaults.StudentManage.set(value: encoded, forKey: .students)
    }
}

extension UserDefaultsStudentsStorage: StudentsStorage {
    func create(_ student: Student) -> Result<Void, Error> {
        let students = fetchStudents()
        if students.contains(student) {
            // TODO: return error: student.name은 이미 존재하는 학생입니다. 추가하지 않습니다
            return .failure(StudentManageError.studentAlreadyExist)
        } else {
            var newStudents = students
            newStudents.append(student)
            update(newStudents)
            return .success
        }
    }
    
    func read(_ name: String) -> Result<Student, Error> {
        guard let target = search(name) else {
            // TODO: return error: student.name 학생을 찾지 못했습니다.
            return .failure(StudentManageError.studentNotFound)
        }
        return .success(target)
    }
    
    func delete(_ name: String) -> Result<Void, Error> {
        guard let target = search(name) else {
            // TODO: return error: student.name 학생을 찾지 못했습니다.
            return .failure(StudentManageError.studentNotFound)
        }
        let students = fetchStudents()
        let newStudents = students.filter { $0 != target }
        update(newStudents)
        return .success
    }
}
