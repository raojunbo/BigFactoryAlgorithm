//
//  Solution739.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/10.
//

import Foundation
// 每日温度，看可不可以采用单调栈。
// 在遍历时，能确定数出栈。不能确定的入栈。入栈保存的是索引。方便计算。
class Solution739 {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result:[Int] = Array(repeating: 0, count: temperatures.count)
        var stack: [Int] = []
        for i in 0..<temperatures.count {
            // 如果栈为空,直接入栈
            if stack.isEmpty {
                stack.append(i)
            } else {
                // 如果比栈顶要大，不断地出栈
                while !stack.isEmpty {
                    let last = stack.last!
                    if temperatures[i] > temperatures[last] {
                        result[last] = i - last
                        stack.removeLast()
                    } else {
                        break
                    }
                }
                stack.append(i)
            }
        }
        return result
    }
    class func test() {
        let solution = Solution739()
        let temperatures =  [30,60,90]
        let result = solution.dailyTemperatures(temperatures)
        print(result)
    }
}
