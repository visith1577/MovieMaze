//
//  NetworkError.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-05.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURLResponse(undelyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(undelyingError: let error):
            return "Failed to parse url \(error.localizedDescription)"
        case .missingConfig:
            return "config is missing"
        case .urlBuildFailed:
            return "Failed to build URL"
        }
    }
}
