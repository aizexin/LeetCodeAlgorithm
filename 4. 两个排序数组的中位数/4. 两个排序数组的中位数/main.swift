//
//  main.swift
//  4. 两个排序数组的中位数
//
//  Created by aizexin on 2018/4/11.
//  Copyright © 2018年 aizexin. All rights reserved.
//
//有两个大小为 m 和 n 的排序数组 nums1 和 nums2 。
//
//请找出两个排序数组的中位数并且总的运行时间复杂度为 O(log (m+n)) 。
//示例 1:
//nums1 = [1, 3]
//nums2 = [2]
//
//中位数是 2.0
//示例 2:
//
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//中位数是 (2 + 3)/2 = 2.5
import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    //总和的数组
    var sumArray = nums1 + nums2
    sumArray.sort()
    
    if sumArray.count % 2 == 0 {
        return (Double(sumArray[(sumArray.count / 2) - 1] + sumArray[(sumArray.count/2)])) * 0.5
    } else {
        return Double(sumArray[sumArray.count / 2])
    }
}

let nums1 = [3]
let nums2 = [1,2]
print(findMedianSortedArrays(nums1, nums2))

