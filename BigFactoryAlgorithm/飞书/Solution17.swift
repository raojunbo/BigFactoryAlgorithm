//
//  Solution17.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/6/10.
//

import Foundation
// 电话号码的字母组合
// 采用回溯的方法
class Solution17 {
    var result: [String] = []
    var path: [String] = []
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        let array = Array(digits).map {String($0)}
        backtrace(array: array, start: 0)
        return result
    }
    func backtrace(array: [String], start: Int) {
        if start >= array.count {
            result.append(path.joined())
            return
        }
        let subArray = digitsNum(array[start])
        for i in 0..<subArray.count {
            path.append(subArray[i])
            backtrace(array: array, start: start + 1)
            path.removeLast()
        }
    }
    func digitsNum(_ c: String) -> [String] {
        var subArray:[Character] = []
        if c == "2" {
            subArray = Array("abc")
        } else if c == "3" {
            subArray = Array("def")
        } else if  c == "4" {
            subArray = Array("ghi")
        } else if c == "5" {
            subArray = Array("jkl")
        } else if c == "6" {
            subArray = Array("mno")
        } else if c == "7" {
            subArray = Array("pqrs")
        } else if c == "8" {
            subArray = Array("tuv")
        } else if c == "9" {
            subArray = Array("wxyz")
        }
        return subArray.map {String($0)}
    }
    class func test() {
        let solution = Solution17()
        let digits = ""
        let result = solution.letterCombinations(digits)
        print(result)
    }
}
