//
//  MovieModelView.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-05.
//

import Foundation
internal import Combine


final class MovieModelView: ObservableObject {
    @Published var trendingMovies: [Title] = []
    @Published var trendingTV: [Title] = []
    @Published var topRatedMovies: [Title] = []
    @Published var topRatedTV: [Title] = []
    
    func loadData() async {
        do {
            trendingMovies = try await TmdbAPIService.shared.fetchTitles(for: .movie, category: .trending)
            topRatedMovies = try await TmdbAPIService.shared.fetchTitles(for: .movie, category: .topRated)
            trendingTV = try await TmdbAPIService.shared.fetchTitles(for: .tv, category: .trending)
            topRatedTV = try await TmdbAPIService.shared.fetchTitles(for: .tv, category: .topRated)
        } catch {
            print("error occured while fetching data")
        }
    }
}
