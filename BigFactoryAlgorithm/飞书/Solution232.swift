//
//  Solution232.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/9.
//

import Foundation
class MyQueue {
    var stack1: [Int] = []
    var stack2: [Int] = []
    init() {

    }
    func push(_ x: Int) {
        stack1.append(x)
    }
    func pop() -> Int {
        peek()
        if !stack2.isEmpty {
          return stack2.removeLast()
        }
        return 0
    }
    
    func peek() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                let last = stack1.removeLast()
                stack2.append(last)
            }
        }
        if !stack2.isEmpty {
            return stack2.last!
        }
        return 0
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}

class Solution232 {
   
    class func test() {
        let queue = MyQueue()
        queue.push(1)
        queue.push(2)
        queue.peek()
        queue.pop()
        queue.empty()
    }
}
