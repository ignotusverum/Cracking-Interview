/// Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabccccaaa would becode a2b1c8a3. If the "compressed" string sould not become smaller than the original string, your method should return the original string.

import Foundation
import XCPlayground

var test1 = "aaaaabaaaaab"
var test2 = "aaccbvbasdskkksadlfopwo"

var testCases: [String] = {
    do {
        let fileURL = Bundle.main.url(forResource: "test", withExtension: "txt")
        let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8).components(separatedBy: "\n")
        return content
    } catch {
        return [test1, test2]
    }
}()

extension String {
    
    /// Replace - Manual
    func manual()-> String {
        
        var result = ""
        var compressDict: [Character: Int] = [:]
        for (i, c) in enumerated() {
            let nextIndexCheck = i+1 < count ? i+1 : i
            let nextChar = self[index(startIndex, offsetBy: nextIndexCheck)]
            
            compressDict[c] = compressDict[c] != nil ? c == nextChar ? compressDict[c]! + 1 : compressDict[c]! + 1 : 1
            
            if c != nextChar || i == count - 1 {
                
                result = "\(result)\(c)\(compressDict[c]!)"
                compressDict[c] = 0
            }
        }
        
        result
        
        return result.count == count ? self : result
    }
}

for test in testCases {
    test.manual()
}

