//
//  main.swift
//  1720. 解码异或后的数组
//
//  Created by aizexin on 2021/6/1.
//

import Foundation

func decode(_ encoded: [Int], _ first: Int) -> [Int] {
    var newArray = [first]
    
    for i in 0..<encoded.count {
        newArray.append(encoded[i] ^ newArray[i])
    }
    return newArray
}

print(decode([1,2,3], 1)) //[1,0,2,1]
print(decode([6,2,7,3], 4)) //[4,2,0,7,4]
print(decode([6], 1)) //[1, 7]
