//
//  TitleModel.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-04.
//

import Foundation

struct APIObject: Codable {
    var results: [Title] = []
}

struct Title: Codable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    var posterUrl: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "\(Constants.basePosterUrl)\(path)")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, name, overview
        case posterPath = "poster_path"
    }
}
