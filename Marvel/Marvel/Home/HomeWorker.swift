//
//  HomeWorker.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

protocol HomeWorkerProtocol {
    func makeGETRequest(completion: @escaping(APIResponse) -> Void)
    func decode(data: Data) -> APIResponse?
}

class HomeWorker: HomeWorkerProtocol {
    private let auth = Auth(endPoint: .characters)
    
    func makeGETRequest(completion: @escaping(APIResponse) -> Void) {
        let timeStamp = Int(Date().timeIntervalSince1970)
        let urlString = auth.makeStringURL(apiKey: "b64080ac39198f95abcdb20fc185b688",
                                                timeStamp: timeStamp,
                                                privateKey: "d4cce909b9e33cd8cb10d483c082a8fe2fca0322")
        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do{
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject as Any, options: .prettyPrinted)
                    guard let apiResponse = self.decode(data: jsonData) else { return }
                    completion(apiResponse)
                }
            } catch {
                error.localizedDescription
            }
            
        }.resume()
    }
    
    func decode(data: Data) -> APIResponse? {
        return try? JSONDecoder().decode(APIResponse.self, from: data)
    }
}
