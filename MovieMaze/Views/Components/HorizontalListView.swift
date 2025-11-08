//
//  HorizontalListView.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-03.
//

import SwiftUI

struct HorizontalListView: View {
    
    let header: String
    let titles: [Title]
    let onSelect: (Title) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(titles, id: \.id) { title in
                        AsyncImage(url: title.posterUrl) { image in
                            image.resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                        .onTapGesture {
                            onSelect(title)
                        }
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(10)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HorizontalListView(
        header: Constants.trendingTVString,
        titles: Title.previewTitles
    ) { title in
        
    }
}
