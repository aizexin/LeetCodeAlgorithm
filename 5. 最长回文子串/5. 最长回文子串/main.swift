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

func longestPalindrome(_ s: String) -> String {
    
    var len = s.count
    
    while len > 0 {
        var location = 0
        while location <= (s.count - len) {
            let indexStart = s.index(s.startIndex, offsetBy: location)
            let indexEnd = s.index(s.startIndex, offsetBy: location + len)
            
            let subSting = String(s[indexStart..<indexEnd])
            if isPalindrome(s: subSting) {
                return subSting
            }
            location = location + 1
        }
        len = len - 1
    }
    return s
}
func isPalindrome(s: String) -> Bool {
   
    for i in 0..<s.count {
        let index = s.index(s.startIndex, offsetBy: i)
        let endIndex = s.index(s.startIndex, offsetBy: s.count - i - 1)
        
        if s[index] != s[endIndex] && i != s.count/2 {
            return false
        }
    }
    return true
}

let testString = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
print(longestPalindrome(testString))


