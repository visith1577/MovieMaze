//
//  MovieModelView.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-05.
//

import Foundation
internal import Combine


final class MovieViewModel: ObservableObject {
    @Published var trendingMovies: [Title] = []
    @Published var trendingTV: [Title] = []
    @Published var topRatedMovies: [Title] = []
    @Published var topRatedTV: [Title] = []
    @Published var heroTitle = Title.previewTitles[0]
    
    func loadData() async {
        if trendingMovies.isEmpty || trendingTV.isEmpty || topRatedMovies.isEmpty || topRatedTV.isEmpty {
            do {
                async let tMovies = TmdbAPIService.shared.fetchTitles(for: .movie, category: .trending)
                async let trMovies = TmdbAPIService.shared.fetchTitles(for: .movie, category: .topRated)
                async let tTv = TmdbAPIService.shared.fetchTitles(for: .tv, category: .trending)
                async let trTv = TmdbAPIService.shared.fetchTitles(for: .tv, category: .topRated)
                
                trendingMovies = try await tMovies
                topRatedMovies = try await trMovies
                trendingTV = try await tTv
                topRatedTV = try await trTv
                
                if let title = trendingMovies.randomElement() {
                    heroTitle = title
                }
            } catch {
                print("error occured while fetching data")
            }
        }
    }
}
