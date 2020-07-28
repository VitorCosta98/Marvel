//
//  Auth.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation
import CryptoKit

class Auth {
    
    func makeAuthenticatedURL(baseURL: String, apiKey: String, timeStamp: Int, privateKey: String) -> String {
        let hash = makeHash(apikey: apiKey, timeStamp: timeStamp, privateKey: privateKey)
        return "\(baseURL)?ts=\(timeStamp)&apikey=\(apiKey)&hash=\(hash)"
    }
    
    private func makeHash(apikey: String, timeStamp: Int, privateKey: String) -> String {
        return "\(timeStamp)\(privateKey)\(apikey)".MD5()
    }
}

extension String {
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
