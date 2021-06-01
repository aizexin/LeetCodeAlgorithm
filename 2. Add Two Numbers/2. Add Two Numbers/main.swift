//
//  main.swift
//  2. Add Two Numbers
//
//  Created by aizexin on 2018/3/14.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import Foundation

print("Hello, World!")


//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val)->" + String(describing: next) + " "
    }
}

extension ListNode {
    func push(_ value :Int) {
        let node = ListNode(value)
        var current = self
        while let next = current.next  {
            current = next
        }
        current.next = node
    }
}

func reverse(currentNode :ListNode?) -> ListNode?  {
    guard var currentNode = currentNode else { return nil}
    var lastNode :ListNode? = nil
    while let next = currentNode.next {
        currentNode.next = lastNode
        lastNode  = currentNode
        //下一个
        currentNode = next
    }
    currentNode.next = lastNode
    return currentNode
}

var temp1 = [4,9]
//[2,4,9]
//[5,6,4,9]
var temp2 = [6,4,9]
var list1 = ListNode(2)
//list1.push(4)
//list1.push(3)
var list2 = ListNode(5)
//list2.push(6)
//list2.push(4)

for item in temp1 {
    list1.push(item)
}
for item in temp2 {
    list2.push(item)
}
//807

print(list1)
print(list2)
print("--------reverse----------")
print(addTwoNumbers(list1,list2)!)
//list1 = reverse(currentNode: list1)!
//list2 = reverse(currentNode: list2)!
//print(list1)
//print(list2)
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var list1 = l1//reverse(currentNode: l1)
    var list2 = l2//reverse(currentNode: l2)
    var list3 : ListNode?
    
    //进的数字
    var advance = 0
    while true {
        let node1 = list1
        let node2 = list2
        if node1 == nil && node2 == nil && advance == 0 {
            break
        }
        let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + advance
        advance = (sum >= 10) ? (sum / 10) :0
        print("advance=",advance,"sum=",sum)
        if list3 == nil {
            list3 = ListNode(sum%10)
        } else {
            list3?.push(sum%10)
        }
        list1 = list1?.next
        list2 = list2?.next
    }
    return list3
}

