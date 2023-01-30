//
//  MainView.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct MainView: View {
    @State var topTabIndex = 0
    @State var bottomTabIndex = 0
    var body: some View {
        ZStack {
            switch bottomTabIndex {
            case 0:
                HomeView()
            case 1:
                SearchView()
            case 2:
                PersonView()
            default:
                DefaultView()
            }
            VStack {
                Spacer()
                BottomTapBar(tabIndex: $bottomTabIndex)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

