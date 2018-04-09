//
//  main.swift
//  3. Longest Substring Without Repeating Characters
//
//  Created by aizexin on 2018/3/14.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import Foundation

print("Hello, World!")

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard let array = s.cString(using: .utf8) else {
        return 0
    }
    print(array.count - 1)
    var len : NSInteger = array.count - 1
    while len > 0 {
        for location in 0...(array.count - 1 - len) {
            let subStr = (s as NSString).substring(with: NSRange.init(location: location, length: len))
            if !checkHasrepeat(str: subStr) {
                return len
            }
        }
        len = len - 1
    }
    return len
}

func checkHasrepeat(str: String) -> Bool {
    var flag = false
    guard let array = str.cString(using: .utf8) else {
        return flag
    }
    for i in 0..<(array.count - 1) {
        for j in i + 1..<(array.count - 1)  {
            if array[i] == array[j] {
                flag = true
                return flag
            }
        }
    }
    return flag
}

let str = "abcabcbb"

print(lengthOfLongestSubstring(str))


