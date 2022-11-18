//
//  UserDefaultsSubjectGradesStorage.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/18.
//

import Foundation

final class UserDefaultsSubjectGradesStorage {
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init() {
        encoder = JSONEncoder()
        decoder = JSONDecoder()
    }
    
    private func fetchSubjectGrades() -> [SubjectGrade] {
        guard let data = UserDefaults.StudentManage.object(forKey: .subjectGrades) as? Data,
              let subjectGrades = try? decoder.decode([SubjectGrade].self, from: data)
        else { return [] }
        return subjectGrades
    }
    
    private func fetchStudents() -> [Student] {
        guard let data = UserDefaults.StudentManage.object(forKey: .students) as? Data,
              let students = try? decoder.decode([Student].self, from: data)
        else { return [] }
        return students
    }
    
    private func student(_ name: String) -> Student? {
        let students = fetchStudents()
        return students.filter { $0.name == name }.first
    }
    
    private func update(_ subjectGrades: [SubjectGrade]) {
        let encoded = try? encoder.encode(subjectGrades)
        UserDefaults.StudentManage.set(value: encoded, forKey: .subjectGrades)
    }
}

extension UserDefaultsSubjectGradesStorage: SubjectGradesStorage {
    func put(_ subjectGrade: SubjectGrade) -> Result<Void, Error> {
        let students = fetchStudents()
        if students.contains(subjectGrade.student) {
            var newGrades = fetchSubjectGrades()
            newGrades.append(subjectGrade)
            update(newGrades)
            return .success
        } else {
            // TODO: return error: student.name 학생을 찾지 못했습니다.
            return .failure(stubError.stub)
        }
    }
    
    func get(studentName: String) -> Result<[SubjectGrade], Error> {
        let target = Student(name: studentName)
        let students = fetchStudents()
        if students.contains(target) {
            let subjectGrades = fetchSubjectGrades()
            let targetGrades = subjectGrades.filter { $0.student == target }
            return .success(targetGrades)
        } else {
            // TODO: return error: student.name 학생을 찾지 못했습니다.
            return .failure(stubError.stub)
        }
    }
    
    func delete(studentName: String, subjectName: String) -> Result<Void, Error> {
        let target = Student(name: studentName)
        let targetSubject = Subject(name: subjectName)
        let students = fetchStudents()
        if students.contains(target) {
            let newGrades = fetchSubjectGrades()
                .filter { ($0.student != target) && ($0.subject != targetSubject) }
            update(newGrades)
            return .success
        } else {
            // TODO: return error: student.name 학생을 찾지 못했습니다.
            return .failure(stubError.stub)
        }
    }
}
