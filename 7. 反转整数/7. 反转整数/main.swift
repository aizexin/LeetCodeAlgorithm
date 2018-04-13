//
//  main.swift
//  7. 反转整数
//
//  Created by aizexin on 2018/4/13.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import Foundation

func reverse(_ x: Int) -> Int {
    var endint :Int
    if x > 0 {
        let end = String("\(x)".reversed())
        endint = Int(end)!
    } else {
        let end = String("\(-x)".reversed())
        endint = -Int(end)!
    }
    if endint < Int(powf(-2, 31)) || endint > Int(powf(2, 31))-1 {
        return 0
    } else {
        return endint
    }
}
print(reverse(1534236469))
