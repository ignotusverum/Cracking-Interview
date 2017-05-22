/// Given Two String, write a method to decide if one is a permutation of the other

let test1 = "dog"
let test2 = "god    "
let test3 = "god"
let test4 = "g o d"
let test5 = "g ooodddw d"
let test6 = "god"

extension String {
    /// Simplify char count
    public var length: Int {
        return characters.count
    }
    
    /// If two strings are anagrams, then we know they have the same characters, but in different order
    func sort()-> String {
        let content = utf16.sorted()
        return String(describing: content)
    }
}


func permutation(_ string1: String, string2: String)-> Bool {

    /// Check if different lengths
    if string1.length != string2.length {
        return false
    }
    
    /// Check if they are identical
    return string1.sort() == string2.sort()
}

permutation(test1, string2: test2)
permutation(test1, string2: test6)