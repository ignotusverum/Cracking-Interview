/*:
 1.8 Tranform an MxN matrix such that if an element is 0 its column and row are zeroed
 */


func zeroedMatrix(_ matrix: [[Int]])-> [[Int]] {
    
    var zeroedMatrix = matrix
    var zeros = Array(repeating: 0, count: matrix.first?.count ?? 0)
    
    for (i, r) in matrix.enumerated() {
        
        guard let column = r.index (where: { $0 == 0 }) else { continue }
        zeroColumns(col: column, matrix: &zeroedMatrix)
        zeroedMatrix[i] = zeros
    }
    
    return zeroedMatrix
}

func zeroColumns(col: Int, matrix: inout [[Int]]) {
    
    for (i, r) in matrix.enumerated() {
     
        var row = r
        row[col] = 0
        matrix[i] = row
    }
}


let matrix = [[1, 2, 3, 4],  [5, 0, 7, 8],  [9, 10, 0, 12],  [13, 14, 15, 16]]

zeroedMatrix(matrix)
