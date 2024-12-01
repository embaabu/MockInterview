//
//  Untitled.swift
//  MockInterview
//
//  Created by Edwin Mbaabu on 11/28/24.
//

import Foundation
//using enum to handle the diffrent error cases that might happen during the api call
enum NetworkError: Error{
    case InvalidURLError
    case dataNotFoundError
    case InvalidStatusCodeResponse
    case InvalidDataResponseError
    case parseDataError
}

extension NetworkError: LocalizedError{
    var errorDescription: String? {
        switch self{
        case .InvalidURLError:
            return "The url on which we are trying to fetch data is invalid"
        case .dataNotFoundError:
            return "Could not get data from the API"
        case .InvalidStatusCodeResponse:
            return "Got invalid status code"
        case .InvalidDataResponseError:
            return "Got invalid data response"
        case .parseDataError:
            return "Could not parse the data"
        }
        
    }
}
