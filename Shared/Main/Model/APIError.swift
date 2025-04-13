//
//  APIError.swift
//  ChatGptiOS
//
//  Created by Vitor Henrique Barreiro Marinho on 13/04/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case noData
    case noMessageFound
    case decodingError(Error)
    case requestError
    case invalidUrl
    
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "No data in response"
        case .noMessageFound:
            return "No message found in response"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .requestError:
            return "Request error"
        case .invalidUrl:
            return "Invalid Url"
        }
    }
}
