//
//  HomeWorker.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

protocol HomeWorkerProtocol {
    func makeGETRequest(urlString: String, completion: @escaping(APIResponseCharacters) -> Void)
    func decode(data: Data) -> APIResponseCharacters?
}

class HomeWorker: HomeWorkerProtocol {
    
    func makeGETRequest(urlString: String, completion: @escaping(APIResponseCharacters) -> Void) {
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
    
    func decode(data: Data) -> APIResponseCharacters? {
        return try? JSONDecoder().decode(APIResponseCharacters.self, from: data)
    }
}
