//
//  KeychainService.swift
//  Notes
//
//  Created by Tekla Matcharashvili on 05.11.23.
//

import UIKit

class KeychainService {
    private let isFirstLoginKey = "isFirstLogin"
    private let usernameKey = "username"
    private let passwordKey = "password"
    
    func saveCredentials(username: String, password: String) {
        _ = Data(username.utf8)
        let passwordData = Data(password.utf8)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: passwordData
        ]
        
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func isFirstLogin() -> Bool {
        let isFirstLogin = UserDefaults.standard.bool(forKey: isFirstLoginKey)
        if !isFirstLogin {
            UserDefaults.standard.set(true, forKey: isFirstLoginKey)
        }
        return !isFirstLogin
    }
    
    func isUserLoggedIn() -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        return status == errSecSuccess
    }
}
