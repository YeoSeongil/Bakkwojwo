//
//  APIManager.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/3/24.
//

import Foundation

class APIManager {
    static let schema = "https"
    static let host = "quotation-api-cdn.dunamu.com"
    static let path = "/v1/forex/recent"
    
    func DunamuAPI(codes: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = APIManager.schema
        components.host = APIManager.host
        components.path = APIManager.path
        
        components.queryItems = [
            URLQueryItem(name: "codes", value: codes)
        ]
        
        return components
    }
    
    func getDunamuData(codes: String) {
        guard let url = DunamuAPI(codes: codes).url else {
            return
        }
        print("URL : \(url)")
        
        let session = URLSession(configuration: .default)
        print("session : \(session)")
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            print(data)

            let decoder = JSONDecoder()
            guard let item = try? decoder.decode([ApiItemModel].self, from: data) else {
                print("error")
                return
            }
            print(item)
            
        }.resume()
    }
}



