/// VZ
/// Implement an algorithm to determine if a string has all unique charactes. What if you cannot use additional data structures ?

let testInput1 = "1234567890qwertyuiopasdfghjklzxcvbnm"
let testInput2 = "111111111111"
let testInput3 = "123456789qwertyuasdfghjxcvbnsdfghertyu345678ertyuidfghjcvbnjk;l;,dijuygvh bjnkliu8y7t6fuchgers45e6r7igyuohinopll,pminuybtv"
let testInput4 = ""

import Foundation

extension String {
    func isStringUnique_check1()-> Bool {
        
        if self.count == 0 {
            return false
        }
        
        var uniqueCheck: [Character: Bool] = [:]
        for c in self {
            
            if uniqueCheck[c] == true {
                return false
            }
            
            uniqueCheck[c] = true
        }
        
        return true
    }
}
