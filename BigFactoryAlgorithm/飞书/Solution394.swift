//
//  Solution394.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/26.
//
// 解码字符串。
// "2[abc]3[cd]ef"
// 遇到数字。找后面是否是[]，有的话进行扩展。
import Foundation
class Solution394 {
    func decodeString(_ s: String) -> String {
        let sArray = Array(s)
        var stack: [Character] = []
        
        for i in 0..<sArray.count {
            let item = sArray[i]
            // 遇到右括号开始计算
            if item == Character("]") {
                var tmp: [Character] = []
                while !stack.isEmpty && stack.last != "[" {
                    let last = stack.removeLast()
                    tmp.insert(last, at: 0)
                }
                // 删除"["
                if !stack.isEmpty {
                    stack.removeLast()
                }
                // 前面的数字
                var muti = 1
                var count = 0
                while !stack.isEmpty && stack.last!.isWholeNumber {
                    count = stack.last!.wholeNumberValue! * muti + count
                    stack.removeLast()
                    muti = muti * 10
                }
                // 重复个数
                for _ in 0..<count {
                    stack = stack + tmp
                }
            } else {
                stack.append(item)
            }
        }
        return String(stack)
    }
    class func test() {
        let solution = Solution394()
        let result = solution.decodeString("2[20[bc]31[xy]]xd4[rt]")
        print(result)
        "bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxybcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxdrtrtrtrt"
        "bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxybcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxdrtrtrtrt"
//        "bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxybcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxdrtrtrtrt"
//        "bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxybcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxyxdrtrtrtrt"
    }
   
}
