//
//  APIManager.swift
//  SPHTechTest
//
//  Created by yuanchun tang on 18/8/2019.
//

import Foundation

let HOST = "https://data.gov.sg/api/"

enum ErrorsToThrow: Error {
    case urlNotValid
    case getDataFail
}

enum API: String {
    case search = "action/datastore_search"
    
    var fullPath: String {
        return "\(HOST)\(self.rawValue)"
    }
}

class APIManager {
    
    private func request<T>(_ modelType: T.Type,
                    _ api: API,
                    _ parameter: [String: Any],
                    _ completionHandler: @escaping (T?, Error?) -> Void) where T : Codable {
        let parameterStr = parameter.keys.map { (key) -> String in
            guard let value = parameter[key] else{return ""}
            return "\(key)=\(value)"
        }.joined(separator: "&")
        
        guard let url = URL(string: api.fullPath+"?"+parameterStr) else {
            completionHandler(nil, ErrorsToThrow.urlNotValid)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            print(url)
            let str = String(data: data, encoding: .utf8)
            print(str ?? "")
            guard let file = try? JSONDecoder().decode(modelType, from: data) else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(file, nil)
            }
        }
        dataTask.resume()
    }
    
    func datastoreSearch(_ resourceID: String, _ limit: Int,  completionHandler: @escaping (DatastoreSearch?, Error?) -> Void) {
        let parameter = ["resource_id": resourceID, "limit": limit] as [String : Any]
        request(DatastoreSearch.self, API.search, parameter as [String : Any], completionHandler)
    }
}

let apiManagerInstance = APIManager()
