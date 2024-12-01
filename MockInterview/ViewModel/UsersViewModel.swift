//
//  UsersViewModel.swift
//  MockInterview
//
//  Created by Edwin Mbaabu on 11/28/24.
//

import Foundation
class UsersViewModel: ObservableObject{
    
    let networkManager: Network
    
    @Published var userData = [UsersModel]()
    @Published var responseError : Error?
    @Published var didErrorOccure = false
    
    
    init(networkManager: Network) {
        self.networkManager = networkManager
        
    }
    
    func getUserProfile() async{
        do{
            let userList = try await self.networkManager.getDataFromUrl(url: "https://jsonplaceholder.typicode.com/users", modelType: [UsersModel].self)
            print(userList)
            DispatchQueue.main.async { [weak self] in
                self?.userData = userList
                
            }
            
        }catch{
            didErrorOccure = true
            print(error.localizedDescription)
            responseError = error
            switch error {
            case is DecodingError:
                responseError = NetworkError.parseDataError
            case NetworkError.InvalidDataResponseError:
                responseError = NetworkError.InvalidDataResponseError
            case NetworkError.InvalidStatusCodeResponse:
                responseError = NetworkError.InvalidStatusCodeResponse
            case NetworkError.InvalidURLError:
                responseError = NetworkError.InvalidURLError
            case NetworkError.dataNotFoundError:
                responseError = NetworkError.dataNotFoundError
                
            default:
                responseError = NetworkError.dataNotFoundError
            }
        }
        
        
        
    }
}
