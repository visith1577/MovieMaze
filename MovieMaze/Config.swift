//
//  Config.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-05.
//

import Foundation

struct Config: Decodable {
    let tmdbBaseUrl: String
    let tmdbAPIKey: String
    
    static let shared: Config? = {
        do {
            return try loadConfig()
        } catch {
            print("failed to load config \(error.localizedDescription)")
            return nil
        }
    }()
    
    private static func loadConfig() throws -> Config {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: ".json") else {
            throw APIConfigError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(Config.self, from: data)
        } catch let error as DecodingError {
            throw APIConfigError.decodingFailed(underlyingError: error)
        } catch {
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
    }
}
