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
    
    init() {
        self.menuService = MenuService()
        self.studentService = StudentService()
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
                print(selectMenu)
            case .deleteSubjectGrade:
                print(selectMenu)
            case .getTotalGrade:
                print(selectMenu)
            case .end:
                print("프로그램을 종료합니다...")
                return
            }
        }
    }

}
