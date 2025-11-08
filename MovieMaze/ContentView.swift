//
//  ContentView.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.homeString, systemImage: Constants.homeIcon) {
                HomeView()
            }
            Tab(Constants.upComingString, systemImage: Constants.upcomingIcon) {
                
            }
            Tab(Constants.serchString, systemImage:
                    Constants.searchIcon) {
                
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIcon) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
