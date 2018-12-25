/// Write a method to replace all spaces in a string with '%20'. You may assume that the string has sufficient space at the end of the stirng to hold the additional chars, and that you are given the true length of a string.

import Foundation

let test1 = "123123123 12312312"
let test2 = "123123123 123123 12"
let test3 = "          123123123 123123 12"

test1.replacingOccurrences(of: " ", with: "%20")
test2.replacingOccurrences(of: " ", with: "%20")
test3.replacingOccurrences(of: " ", with: "%20")

extension String {
    var encodedString: String {
        let regex = try! NSRegularExpression(pattern: "\\s", options: .caseInsensitive)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: "%20")
    }
}

test1.encodedString

