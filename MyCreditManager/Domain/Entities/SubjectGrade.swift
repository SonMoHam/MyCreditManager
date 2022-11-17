//
//  SubjectGrade.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

struct SubjectGrade {
    let student: Student
    let subject: Subject
    let grade: Grade
}

extension SubjectGrade: Equatable {
    static func == (lhs: SubjectGrade, rhs: SubjectGrade) -> Bool {
        lhs.student == rhs.student && lhs.subject == rhs.subject    // 동일 학생, 동일 과목의 경우
    }
}
