//
//  SubjectGrade.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

public struct SubjectGrade {
    let student: Student
    let subject: Subject
    let grade: Grade
}

extension SubjectGrade: Hashable, Codable {
    public static func == (lhs: SubjectGrade, rhs: SubjectGrade) -> Bool {
        lhs.student == rhs.student && lhs.subject == rhs.subject    // 동일 학생, 동일 과목의 경우
    }
}
