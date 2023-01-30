//
//  TopTapBar.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct TopTapBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -10) {
                TopTapButton(text: "Trendings", isSelected: .constant(tabIndex == 0))
                    .onTapGesture {
                        onButtonTapped(index: 0)
                    }
                TopTapButton(text: "Artists", isSelected: .constant(tabIndex == 1))
                    .onTapGesture {
                        onButtonTapped(index: 1)
                    }
                TopTapButton(text: "Clips", isSelected: .constant(tabIndex == 2))
                    .onTapGesture {
                        onButtonTapped(index: 2)
                    }
                TopTapButton(text: "Stories", isSelected: .constant(tabIndex == 3))
                    .onTapGesture {
                        onButtonTapped(index: 3)
                    }
                TopTapButton(text: "Stickers", isSelected: .constant(tabIndex == 4))
                    .onTapGesture {
                        onButtonTapped(index: 4)
                    }
            }
            .padding(.horizontal, 10)
            .frame(height: 60)
            
        }
        .background(Color.black)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct TopTapBar_Previews: PreviewProvider {
    static var previews: some View {
        TopTapBar(tabIndex: .constant(0))
    }
}

