//
//  StudentService.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

final class StudentService {
    private let studentUseCase: StudentUseCase
    
    init(studentUseCase: StudentUseCase) {
        self.studentUseCase = studentUseCase
    }
    
    func post() {
        let guide = "추가할 학생의 이름을 입력해주세요"
        let name = getStudentName(inputGuide: guide)
        let student = Student(name: name)
        let result = studentUseCase.insert(student)
        switch result {
        case .success:
            print("\(name) 학생을 추가했습니다.")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func delete() {
        let guide = "삭제할 학생의 이름을 입력해주세요"
        let name = getStudentName(inputGuide: guide)
        let result = studentUseCase.delete(name: name)
        switch result {
        case .success:
            print("\(name) 학생을 삭제하였습니다.")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    
    private func getStudentName(inputGuide: String) -> String {
        while true {
            print(inputGuide)
            if let input = readLine(), input.isValid() {
                return input.capitalized    // 대소문자 형식 고정
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                continue
            }
        }
    }
}
