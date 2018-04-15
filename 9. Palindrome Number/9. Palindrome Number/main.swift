//
//  main.swift
//  9. Palindrome Number
//
//  Created by 艾泽鑫 on 2018/4/14.
//  Copyright © 2018年 艾泽鑫. All rights reserved.
// Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
// 确定一个整数是否为回文。

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    } else {
        return String("\(x)".reversed()) == "\(x)"
    }
}

