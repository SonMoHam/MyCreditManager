//
//  main.swift
//  MyCreditManager
//
//  Created by Son Daehong on 2022/11/17.
//

import Foundation

let useCaseProvider: UseCaseProvider = DefaultUseCaseProvider()
let appManger = AppManager(useCaseProvider: useCaseProvider)
appManger.start()
