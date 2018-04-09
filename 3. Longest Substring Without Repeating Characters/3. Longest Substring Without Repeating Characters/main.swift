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

func lengthOfLongestSubstring(_ str: String) -> Int {
    var set = Set<Character>()
    var maxLen = 0
    var index = 0
    while index < str.count {
        let indexStart = str.index(str.startIndex, offsetBy: index)
        let subSting = str[indexStart...]
        for c in subSting {
            if set.contains(c) {
                if maxLen < set.count {
                    maxLen = set.count
                }
                set.removeAll()
            }
            set.insert(c)
        }
        if maxLen < set.count {
            maxLen = set.count
        }
        set.removeAll()
        index = index + 1
    }
    
    return maxLen
}


let tempString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:"

print(lengthOfLongestSubstring(tempString))


