//
//  main.swift
//  5. 最长回文子串
//
//  Created by aizexin on 2018/4/11.
//  Copyright © 2018年 aizexin. All rights reserved.
//  给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 长度最长为1000。
//示例:
//
//输入: "babad"
//
//输出: "bab"
//
//注意: "aba"也是有效答案
//
//示例:
//
//输入: "cbbd"
//
//输出: "bb"
import Foundation

let startTime = CFAbsoluteTimeGetCurrent()

func longestPalindrome(_ s: String) -> String {
    var str = s
    var rArray   = [Int]()
    
    if s.count <= 1 {
        return s
    }
    var set = Set<Character>()
    for c in s {
        set.insert(c)
        if set.count > 1 {
            break
        }
    }
    if set.count <= 1 {
        return s
    }
    //manacher
    for i in 0...s.count {
        let index = str.index(str.startIndex, offsetBy:2*i)
        str.insert("#", at: index)
        rArray.append(1)
        rArray.append(1)
    }
    
    var maxRight = 0
    var pos      = 0
    
    var maxRadius = 0
    var maxPos   = 0

    for i in 0..<str.count {
        if i<maxRight {
            rArray[i] = min(maxRight-i+1, rArray[2*pos-i])
        } else {
            rArray[i] = 1
        }
        //判断pos = i开始左右判断是否相等
        while true {
            if i-rArray[i]<0 || i+rArray[i]>=str.count {
                break
            }
            let star = str[str.index(str.startIndex, offsetBy: i-rArray[i])]
            let end  =  str[str.index(str.startIndex, offsetBy: i+rArray[i])]
            if star == end {
                rArray[i] = rArray[i] + 1
            } else {
                break
            }
        }
        if rArray[i]+i > maxRight {
            pos = i
            maxRight = rArray[i]+i-1
        }
      
        if maxRadius <= rArray[i] {
            maxRadius = rArray[i]
            maxPos    = i
            if maxRadius > (str.count / 2) {
                break
            }
        }
    }
    
    let starIndex = str.index(str.startIndex, offsetBy: maxPos - maxRadius+1)
    let endIndex  = str.index(str.startIndex, offsetBy: maxPos + maxRadius-1)
    let palinStr  = String(str[starIndex...endIndex]).filter { (c) -> Bool in
        return c != "#"
    }
    return palinStr
}

let testString = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
print(longestPalindrome(testString))
let endTime = CFAbsoluteTimeGetCurrent()
print("执行时间:\((endTime-startTime)*1000)")
