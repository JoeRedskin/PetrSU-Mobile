//
//  DataValidation.swift
//  PetrSU Mobile
//
//  Created by User on 09/12/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import Foundation

func validateGroupNumber(number: String) -> Bool {
    let range = NSRange(location: 0, length: number.count)
    let reg = "^[a-zA-ZА-Яа-я0-9()-]{3,7}$"
    let regex = try! NSRegularExpression(pattern: reg)
    if regex.firstMatch(in: number, options: [], range: range) != nil{
        return true
    } else {
        return false
    }
}

//func validateName(name: String) -> Bool {
//    if name.count > 1 {
//        let range = NSRange(location: 0, length: name.count)
//        let reg = "^[a-zA-ZА-Яа-яЁё]{1,30}$"
//        let regex = try! NSRegularExpression(pattern: reg)
//        if regex.firstMatch(in: name, options: [], range: range) != nil{
//            return true
//        } else {
//            return false
//        }
//    } else {
//        return false
//    }
//}
//
//func validatePassword(pass: String) -> Bool {
//    let reg = "^(?=.*\\d)(?=.*[a-zA-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,32}$"
//    let range = NSRange(location: 0, length: pass.count)
//    let regex = try! NSRegularExpression(pattern: reg)
//    if regex.firstMatch(in: pass, options: [], range: range) != nil{
//        return true
//    } else {
//        return false
//    }
//}

