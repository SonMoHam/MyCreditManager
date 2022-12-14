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
        guard let subjectGrade = getPutQuery() else { return }
        let result = subjectGradeUseCase.put(subjectGrade)
        switch result {
        case .success:
            // TODO: 문자열 subjectGrade description으로 변경
            print("\(subjectGrade.student.name) 학생의 \(subjectGrade.subject.name) 과목이 \(subjectGrade.grade)로 추가(변경)되었습니다.")
        case .failure(let error):
            print("\(subjectGrade.student.name) \(error.localizedDescription)")
        }
    }
    
    func delete() {
        guard let queryParams = getDeleteQuery() else { return }
        let result = subjectGradeUseCase.delete(
            studentName: queryParams.studentName, subjectName: queryParams.subjectName)
        switch result {
        case .success:
            print("\(queryParams.studentName) 학생의 \(queryParams.subjectName) 과목의 성적이 삭제되었습니다.")
        case .failure(let error):
            print("\(queryParams.studentName) \(error.localizedDescription)")
        }
    }
    
    func getTotal() {
        guard let studentName = getStudentName() else { return }
        let result = subjectGradeUseCase.get(studentName: studentName)
        switch result {
        case .success(let subjectGrades):
            let avgPoint = subjectGrades
                .map { $0.grade.score }
                .reduce(0.0) { $0 + $1 } / Double(subjectGrades.count)

            subjectGrades.forEach {
                print("\($0.subject.name): \($0.grade)")
            }
            let decimalPlace = Double(2)
            let decimalNum = pow(10.0, decimalPlace)
            let truncated = floor(avgPoint * decimalNum) / decimalNum
            let avgStr = truncated == floor(truncated) ? "\(Int(truncated))" : "\(truncated)"
            print("평점 : \(subjectGrades.isEmpty ? "없음" : avgStr)")
            
        case .failure(let error):
            print("\(studentName) \(error.localizedDescription)")
        }
    }
    
    private func getPutQuery() -> SubjectGrade? {
        let countOfQueryParams: Int = 3
        let guide = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."

        print(guide)
        guard let params = readLine()?.split(separator: " ").map({ String($0).capitalized }),
              params.count == countOfQueryParams,
              params[0].isValid(), params[1].isValid(),
              let grade = Grade(params[2])
        else {
            showInputInvalid()
            return nil
        }
        return SubjectGrade(
            student: Student(name: params[0]),
            subject: Subject(name: params[1]),
            grade: grade)
    }
    
    private func getDeleteQuery() -> (studentName: String, subjectName: String)? {
        let countOfQueryParams: Int = 2
        let guide = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift"
        print(guide)
        
        guard let params = readLine()?.split(separator: " ").map({ String($0).capitalized }),
              params.count == countOfQueryParams,
              params[0].isValid(), params[1].isValid()
        else {
            showInputInvalid()
            return nil
        }
        return (studentName: params[0], subjectName: params[1])
    }
    
    private func getStudentName() -> String? {
        let guide = "평점을 알고싶은 학생의 이름을 입력해주세요"
        print(guide)
        guard let input = readLine()?.capitalized,
              input.isValid()
        else {
            showInputInvalid()
            return nil
        }
        return input
    }
    
    private func showInputInvalid() {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}
