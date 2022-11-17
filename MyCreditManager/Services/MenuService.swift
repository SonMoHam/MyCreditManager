//
//  MenuService.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

final class MenuService {
    func getSelectMenu() -> ServiceMenu {
        while true {
            let rawValue = getSelectService()
            
            guard let selectMenu = ServiceMenu(rawValue: rawValue) else {
                showSelectInvalid()
                continue
            }
            return selectMenu
        }
    }
    
    private func getSelectService() -> String {
        showSelectGuide()
        return readLine() ?? ""
    }
    
    private func showSelectInvalid() {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
    
    private func showSelectGuide() {
        print("\n원하는 기능을 입력해주세요")
        print(ServiceMenu.selectGuide)
    }
}
