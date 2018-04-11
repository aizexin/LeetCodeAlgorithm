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

print(Date())
func longestPalindrome(_ s: String) -> String {
    
    var len = 0
    var star : String.Index = String.Index.init(encodedOffset: 0)
    var end  : String.Index = String.Index.init(encodedOffset: 0)
    
    var pd = [[Bool]]()
    for _ in 0..<s.count {
        var array = [Bool]()
        for _ in 0..<s.count {
            array.append(false)
        }
        pd.append(array)
    }
    
    for i in 0..<s.count {
        for j in 0..<s.count {
            let index    = s.index(s.startIndex, offsetBy: j)
            let endIndex = s.index(s.startIndex, offsetBy: i)
            
            if i-j<2 {
                pd[j][i] = (s[index] == s[endIndex])
            } else {
                pd[j][i] = (s[index] == s[endIndex] && pd[j+1][i-1])
            }
            if pd[j][i] && len<(i-j+1) {
                len = i-j+1
                star = index
                end  = endIndex
            }
        }
    }
    
    return String(s[star...end])
}


let testString = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
print(longestPalindrome(testString))

print(Date())


