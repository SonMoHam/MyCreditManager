//
//  Result+.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

extension Result where Success == Void {
    public static var success: Result { .success(()) }
}
