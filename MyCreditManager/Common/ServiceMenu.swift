//
//  ServiceMenu.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

enum ServiceMenu: String, CustomStringConvertible, CaseIterable {
    case postStudent = "1"
    case deleteStudent = "2"
    case putSubjectGrade = "3"
    case deleteSubjectGrade = "4"
    case getTotalGrade = "5"
    case end = "X"
    var description: String {
        switch self {
        case .postStudent:
            return "학생추가"
        case .deleteStudent:
            return "학생삭제"
        case .putSubjectGrade:
            return "성적추가(변경)"
        case .deleteSubjectGrade:
            return "성적삭제"
        case .getTotalGrade:
            return "평점보기"
        case .end:
            return "종료"
        }
    }
    
    static var selectGuide: String {
        Self.allCases
            .map { "\($0.rawValue): \($0.description)"}
            .joined(separator: ", ")
    }
}
