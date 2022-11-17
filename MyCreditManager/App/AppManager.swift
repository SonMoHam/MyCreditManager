//
//  AppManager.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

final class AppManager {
    private let menuService: MenuService
    
    init() {
        self.menuService = MenuService()
    }
    
    func start() {
        while true {
            let selectMenu = menuService.getSelectMenu()

            switch selectMenu {
            case .postStudent:
                print(selectMenu)
            case .deleteStudent:
                print(selectMenu)
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
