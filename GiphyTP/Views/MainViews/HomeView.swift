//
//  HomeView.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct HomeView: View {
    @State var tabIndex = 0
    var body: some View {
        ZStack {
            switch tabIndex {
            case 0:
                TrendingView()
            case 1:
                ArtistsView()
            case 2:
                ClipsView()
            case 3:
                StoriesView()
            case 4:
                StickersView()
            default:
                DefaultView()
            }
            VStack {
                TopTapBar(tabIndex: $tabIndex)
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
