/// Implement a function which reverses a null-terminated string

import Foundation

let testStr1 = "123123123123123"
let testStr2 = "qwertyuiop"
let testStr3 = "qwertyuiopasdfghjklzxcvbnm"

//public init(cString: UnsafePointer<CChar>)
//public init(cString: UnsafePointer<UInt8>)

extension String {
    public init?(validatingUTF8 cString: UnsafePointer<UInt8>) {
        guard let (s, _) = String.decodeCString(cString, as: UTF8.self,
                                                repairingInvalidCodeUnits: false) else {
                                                    return nil
        }
        self = s
    }
}
