//
//  NetworkManager.swift
//  MockInterview
//
//  Created by Edwin Mbaabu on 11/27/24.
//
//

import Foundation

protocol Network{
    //creating a generic function
    func getDataFromUrl<T: Decodable>(url:String ,modelType:T.Type) async throws -> T
}

class NetworkMnager{
    
    let urlSession : URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkMnager: Network{
    
    func getDataFromUrl<T>(url: String, modelType: T.Type) async throws -> T where T : Decodable {
        
        guard let urlObject = URL(string: url) else{
            throw NetworkError.InvalidURLError
            
        }
        do{
            let (data, respose) = try await self.urlSession.data(from: urlObject)
            /*
             this is for erro handling
             first we chech if we are getting the a response
             then chech the status code of the response
             then we parse the data
             */
        
            guard let response = respose as? HTTPURLResponse else{
                throw NetworkError.InvalidDataResponseError
            }
            guard (200...299).contains(response.statusCode) else{
                throw NetworkError.InvalidStatusCodeResponse
            }
            
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
            
        }catch{
            print(error.localizedDescription)
            
            throw error
            
        }
        
    }
    
}

