//
//  tmdbAPIService.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-05.
//

import Foundation

enum MediaType: String {
    case movie, tv
}

enum Category: String {
    case trending
    case topRated = "top_rated"
    
    func path(for type: MediaType) -> String {
        switch self {
        case .topRated:
            return "3/\(type.rawValue)/top_rated"
        case .trending:
            return "3/trending/\(type.rawValue)/day"
        }
    }
}

final class TmdbAPIService {
    static let shared = TmdbAPIService()
    private init() {}
    
    var tmdbBaseUrl = Config.shared?.tmdbBaseUrl
    var tmdbAPIKey = Config.shared?.tmdbAPIKey
    
    func fetchTitles(for type: MediaType, category: Category) async throws -> [Title] {
        guard let baseUrl = tmdbBaseUrl else {
            throw NetworkError.missingConfig
        }
        
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        let urlPath = category.path(for: type)
        
        guard let fetchUrl = URL(string: baseUrl)?
            .appending(path: urlPath)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        let (data, URLResponse) = try await URLSession.shared.data(from: fetchUrl)
        
        guard let response = URLResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(undelyingError: NSError(
                domain: "DataFetcher",
                code: (URLResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid Http Response"]
            ))
        }
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(APIObject.self, from: data)
        return decoded.results
    }
}
