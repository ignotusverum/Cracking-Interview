/// Given Two String, write a method to decide if one is a permutation of the other

let test1 = "dog"
let test2 = "god    "
let test3 = "god"
let test4 = "g o d"
let test5 = "g ooodddw d"
let test6 = "god"

extension String {
    public var length: Int {
        return characters.count
    }
    
    func sort()-> String {
        let content = utf16.sorted()
        return String(describing: content)
    }
}

func permutation(_ string1: String, string2: String)-> Bool {
    
    if string1.length != string2.length {
        return false
    }
    
    return string1.sort() == string2.sort()
}

permutation(test1, string2: test2)
permutation(test1, string2: test6)