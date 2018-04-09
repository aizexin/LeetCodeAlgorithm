//
//  main.swift
//  3. Longest Substring Without Repeating Characters
//
//  Created by aizexin on 2018/3/14.
//  Copyright © 2018年 aizexin. All rights reserved.
//
//给定一个字符串，找出不含有重复字符的 最长子串 的长度。
//
//示例：
//
//给定 "abcabcbb" ，没有重复字符的最长子串是 "abc" ，那么长度就是3。
//
//给定 "bbbbb" ，最长的子串就是 "b" ，长度是1。
//
//给定 "pwwkew" ，最长子串是 "wke" ，长度是3。请注意答案必须是一个子串，"pwke" 是 子序列 而不是子串。

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard let array = s.cString(using: .utf8) else {
        return 0
    }
    if s.count == 1 {
        return 1
    }
    var len : Int = array.count - 1
    while len > 0 {
        for location in 0...(array.count - 1 - len) {
            
            let indexStart = s.index(s.startIndex, offsetBy: location)
            let indexEnd = s.index(s.startIndex, offsetBy: location + len)
            let subStr = s[indexStart..<indexEnd]
            if !checkHasrepeat(str: String(subStr)) {
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

let str = "pwwkew"

print(lengthOfLongestSubstring(str))


