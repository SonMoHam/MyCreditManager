//
//  String+.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let regex = "^[ 0-9a-zA-Z]"     // 스페이스, 숫자, 영문 대소
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
}


