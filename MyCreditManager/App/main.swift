//
//  main.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

func start() {
    while true {
        print("\n원하는 기능을 입력해주세요")
        print(ServiceMenu.selectGuide)
        let input = readLine() ?? ""
        
        guard let selectMenu = ServiceMenu(rawValue: input) else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            continue
        }
        
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
start()
