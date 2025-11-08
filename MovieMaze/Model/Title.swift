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

struct Title: Codable, Identifiable, Hashable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    var posterUrl: URL? {
        guard let path = posterPath else { return URL(string: Constants.testTitleURL) }
        return URL(string: "\(Constants.basePosterUrl)\(path)")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, name, overview
        case posterPath = "poster_path"
    }
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice", name: "BeetleJuice", overview: "A movie about BeetleJuice", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Pulp Fiction", name: "Pulp Fiction", overview: "A movie about Pulp Fiction", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "The Dark Knight", name: "The Dark Knight", overview: "A movie about the Dark Knight", posterPath: Constants.testTitleURL3)
    ]
}
