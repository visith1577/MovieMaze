//
//  APIConfigError.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-05.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "API Config file not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "failed to load data from API config file: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return  "Failed to decode API config: \(error.localizedDescription)"
        }
    }
}
