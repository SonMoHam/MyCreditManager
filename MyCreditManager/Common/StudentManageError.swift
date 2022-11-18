//
//  StudentManageError.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/18.
//

import Foundation

enum StudentManageError: LocalizedError {
    case studentNotFound
    case studentAlreadyExist
    
    var errorDescription: String? {
        switch self {
        case .studentNotFound: return "학생을 찾지 못했습니다."
        case .studentAlreadyExist: return "이미 존재하는 학생입니다. 추가하지 않습니다."
        }
    }
}
