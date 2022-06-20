//
//  Solution54.swift
//  BigFactoryAlgorithm
//
//  Created by junbo.rao on 2022/5/24.
//

import Foundation
class Solution54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result: [Int] = []
        let total = matrix.count * matrix[0].count
        let rowCount = matrix.count
        let colCount = matrix[0].count
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        let directions = [
            [0, 1],
            [1, 0],
            [0, -1],
            [-1, 0]
        ]
        var row = 0
        var column = 0
        var directionIndex = 0
        for _ in 0..<total {
            result.append(matrix[row][column])
            visited[row][column] = true
            
            let nextRow = row + directions[directionIndex][0]
            let nextColumn = column + directions[directionIndex][1]
            if nextRow < 0 ||
                nextRow >= rowCount ||
                nextColumn < 0 ||
                nextColumn >= colCount ||
                visited[nextRow][nextColumn] {
                // 不满足条件该边方向
                directionIndex = (directionIndex + 1) % 4
            }
            row += directions[directionIndex][0]
            column += directions[directionIndex][1]
        }
        return result
    }
    class func test() {
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        let solution = Solution54()
        let result =  solution.spiralOrder(matrix)
        print(result)
    }
}
