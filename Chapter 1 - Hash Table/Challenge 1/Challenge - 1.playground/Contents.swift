/// VZ
/// Implement an algorithm to determine if a string has all unique charactes. What if you cannot use additional data structures ?

let testInput1 = "1234567890qwertyuiopasdfghjklzxcvbnm"
let testInput2 = "111111111111"
let testInput3 = "123456789qwertyuasdfghjxcvbnsdfghertyu345678ertyuidfghjcvbnjk;l;,dijuygvh bjnkliu8y7t6fuchgers45e6r7igyuohinopll,pminuybtv"

import Foundation

/// Adding length extension
extension String {
    public var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
    /// Complexity O(n)
    public var isCharsUnique: Bool {
        if length > 256 {
            return false
        }
        
        var charSet: [String: Bool] = [:]
        for i in 0..<length {
            
            let val = self[i]
            if charSet[val] == true {
                return false
            }
            
            charSet[val] = true
        }
        
        return true
    }
}

testInput1.isCharsUnique
