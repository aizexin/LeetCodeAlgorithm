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
    var arry = [Character]()
    var maxLen = 0

    for c in str {
        if set.contains(c) {
            if maxLen < arry.count {
                maxLen = arry.count
            }
            while true {
                if arry.first == c {
                    set.remove(arry.first!)
                    arry.removeFirst()
                    break
                }
                set.remove(arry.first!)
                arry.removeFirst()
                
            }
        }
        set.insert(c)
        arry.append(c)
    }
    if maxLen < arry.count {
        maxLen = arry.count
    }
    return maxLen
}


let tempString = "abcabcbb"

print(lengthOfLongestSubstring(tempString))


