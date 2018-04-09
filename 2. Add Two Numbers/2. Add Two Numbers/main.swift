//
//  main.swift
//  2. Add Two Numbers
//
//  Created by aizexin on 2018/3/14.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import Foundation

print("Hello, World!")

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

func addTwoNumbers(_ l1: [Int], _ l2: [Int]) -> [Int] {
    
    var goon = true
    var carry = 0
    var list3 = [Int]()
    var index = max(l1.count, l2.count) - 1
    while goon {
        
        if index < 0 {
            goon = false
            break
        }
        let value1 = index < l1.count ? l1[index] : 0
        let value2 = index < l2.count ? l2[index] : 0
        var tempval = 0
        if value1 + value2 + carry > 9 {
            tempval = (value1 + value2 + carry) % 10
            carry = (value1 + value2 + carry) / 10
        } else {
            tempval = value1 + value2 + carry
        }
        index = index - 1
        list3.append(tempval)
    }
    return list3
}

var temp1 = [2,4,3]
var temp2 = [5,6,4]


let valList = addTwoNumbers(temp1, temp2)
print(valList)

