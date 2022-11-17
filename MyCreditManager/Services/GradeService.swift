//
//  GradeService.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

final class GradeService {
    private let subjectGradeUseCase: SubjectGradeUseCase
    
    init(subjectGradeUseCase: SubjectGradeUseCase) {
        self.subjectGradeUseCase = subjectGradeUseCase
    }
    
    func put() {
        let subjectGrade = getPutQuery()
        let result = subjectGradeUseCase.put(subjectGrade)
        switch result {
        case .success:
            // TODO: 문자열 subjectGrade description으로 변경
            print("\(subjectGrade.student.name) 학생의 \(subjectGrade.subject.name) 과목이 \(subjectGrade.grade)로 추가(변경)되었습니다.")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func delete() {
        
    }
    
    func getTotal() {
        
    }
    
    private func getPutQuery() -> SubjectGrade {
        let countOfQueryParams: Int = 3
        let guide = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
        while true {
            print(guide)
            guard let input = readLine(), validate(input, countOfQueryParams: countOfQueryParams)
            else {
                showInputInvalid()
                continue
            }
            let params = input.split(separator: " ").map { String($0) }
            guard let grade = Grade(rawValue: params[2]) else {
                showInputInvalid()
                continue
            }
            return SubjectGrade(
                student: Student(name: params[0]),
                subject: Subject(name: params[1]),
                grade: grade)
        }
    }
    
    private func validate(_ input: String, countOfQueryParams: Int) -> Bool {
        let split = input.split(separator: " ")
        return input.isValid() && split.count == countOfQueryParams
    }
    
    private func showInputInvalid() {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}
