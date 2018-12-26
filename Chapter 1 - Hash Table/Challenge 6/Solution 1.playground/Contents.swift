/// Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

import UIKit
import Foundation

struct MatrixImage {
    let rows: Int
    let columns: Int
    
    var rAngle: Int? = nil
    var center: IndexPath? = nil
    
    var values: [(key: IndexPath, value: String)] = []
    
    init(dimension: Int) {
        
        self.rows = dimension
        self.columns = dimension
    
        self.center = findCenter()
        self.values = createMatrix(dimension: dimension)
    }
    
    private func createMatrix(dimension: Int)-> [(key: IndexPath, value: String)] {
        var result: [IndexPath: String] = [:]
        for i in 0..<dimension {
            for j in 0..<dimension {
                let indexPath = IndexPath(row: j, section: i)
                result[indexPath] = "^^^^"
            }
        }
        
        return result.sorted(by: { $0.0.section < $1.0.section })
    }
    
    private func findCenter()-> IndexPath? {
        
        let cv = Int(floor(Double(rows)/2))
        return rows % 2 == 0 ? nil : IndexPath(item: cv, section: cv)
    }
}


func display(_ array: [[String]])-> String {
    var display = ""
    for (i, r) in array.enumerated() {
        for c in r {
            display = "\(display) \(c)"
        }
        
        display = "\(display) \(i != array[i].count - 1 ? "\n" : "")"
    }
    
    return display
}

func rotate(_ array: [[String]])-> [[String]] {
    
    
    
    return []
}

MatrixImage(dimension: 4)



