//
//  KeychainWrapper.swift
//  Project Elsa
//
//  Created by Dennis Silva on 2/4/21.
//

import SwiftKeychainWrapper

func storeAccessToken(forToken token: String) {
    KeychainWrapper.standard.set(token, forKey: "AccessToken")
}

func storeKeychainValue(forValue value: String, forKey key: String) {
    KeychainWrapper.standard.set(value, forKey: key)
}

func retrieveKeychainValue(forKey key: String) -> String? {
    return KeychainWrapper.standard.string(forKey: key)
}
