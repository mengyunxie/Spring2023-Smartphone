//
//  KeychainService.swift
//  InstaPicture
//
//  Created by Miya on 4/19/23.
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
