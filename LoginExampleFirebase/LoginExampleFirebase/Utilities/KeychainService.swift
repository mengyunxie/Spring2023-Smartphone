//
//  KeychainService.swift
//  LoginExampleFirebase
//
//  Created by Miya on 3/18/23.
//

import Foundation
import KeychainSwift

class KeychainService {
    var _keyChain = KeychainSwift()
        
    var keyChain : KeychainSwift {
        get {
            return _keyChain
        }
        set {
            _keyChain = newValue
        }
    }
}
