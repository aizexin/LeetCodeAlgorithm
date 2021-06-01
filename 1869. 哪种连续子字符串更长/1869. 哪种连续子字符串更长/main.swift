//
//  main.swift
//  1869. 哪种连续子字符串更长
//
//  Created by aizexin on 2021/6/1.

import Foundation

func checkZeroOnes(_ s: String) -> Bool {
    var maxZeroNum = 0
    var maxOneNum = 0
    var tempZeroNum = 0
    var tempOneNum = 0
    var lastCharacter :String.Element = "x"
    for item in s {
        if lastCharacter != item {
            if lastCharacter == "1" {
                maxOneNum = max(maxOneNum, tempOneNum)
            } else {
                maxZeroNum = max(maxZeroNum, tempZeroNum)
            }
            tempOneNum = 0
            tempZeroNum = 0
        }
        if item == "0" {
            tempZeroNum = tempZeroNum + 1
        }
        if item == "1" {
            tempOneNum = tempOneNum + 1
        }
        lastCharacter = item
    }
    if lastCharacter == "1" {
        maxOneNum = max(maxOneNum, tempOneNum)
    } else {
        maxZeroNum = max(maxZeroNum, tempZeroNum)
    }

    return maxOneNum > maxZeroNum ? true:false
}
print(checkZeroOnes("011000111"))

