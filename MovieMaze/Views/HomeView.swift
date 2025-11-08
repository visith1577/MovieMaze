//
//  HomeView.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-02.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = MovieViewModel()
    @State private var titleDetailPath = NavigationPath()
    
    var body: some View {
        GeometryReader { geom in
            NavigationStack(path: $titleDetailPath) {
                ScrollView {
                    LazyVStack {
                        AsyncImage(url: vm.heroTitle.posterUrl) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .clear, location: 0.8),
                                            Gradient.Stop(color: .gradient, location: 1)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geom.size.width, height: geom.size.height * 0.85)
                        HStack {
                            Button {
                                titleDetailPath.append(vm.heroTitle)
                            } label: {
                                Text(Constants.playString)
                                    .ghostButton()
                            }
                            Button {
                                
                            } label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }
                        }
                        HorizontalListView(
                            header: Constants.trendingMoviesString,
                            titles: vm.trendingMovies
                        ) { title in
                            titleDetailPath.append(title)
                        }
                        HorizontalListView(
                            header: Constants.trendingTVString,
                            titles: vm.trendingTV
                        ) { title in
                            titleDetailPath.append(title)
                        }
                        HorizontalListView(
                            header: Constants.topRatedMoviesString,
                            titles: vm.topRatedMovies
                        ) { title in
                            titleDetailPath.append(title)
                        }
                        HorizontalListView(
                            header: Constants.topRatedTVString,
                            titles: vm.topRatedTV
                        ) { title in
                            titleDetailPath.append(title)
                        }
                    }
                    .task {
                        await vm.loadData()
                    }
                    .navigationDestination(for: Title.self) { title in
                        TitleDetailView(title: title)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
