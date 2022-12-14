//
//  AppManager.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

final class AppManager {
    private let menuService: MenuService
    private let studentService: StudentService
    private let gradeService: GradeService
    
    init(useCaseProvider: UseCaseProvider) {
        let studentUseCase = useCaseProvider.makeStudentUseCase()
        let subjectGradeUseCase = useCaseProvider.makeSubjectGradeUseCase()
        self.menuService = MenuService()
        self.studentService = StudentService(studentUseCase: studentUseCase)
        self.gradeService = GradeService(subjectGradeUseCase: subjectGradeUseCase)
    }
    
    func start() {
        while true {
            let selectMenu = menuService.getSelectMenu()

            switch selectMenu {
            case .postStudent:
                studentService.post()
            case .deleteStudent:
                studentService.delete()
            case .putSubjectGrade:
                gradeService.put()
            case .deleteSubjectGrade:
                gradeService.delete()
            case .getTotalGrade:
                gradeService.getTotal()
            case .end:
                print("프로그램을 종료합니다...")
                return
            }
        }
    }

}
