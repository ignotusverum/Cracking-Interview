/*:
 1.8 String rotation
 */

import Foundation

extension String {
    func isSubstring(_ string: String) -> Bool {
        return (self + self).contains(string)
    }
}

"waterbottle".isSubstring("erbottlewat")
