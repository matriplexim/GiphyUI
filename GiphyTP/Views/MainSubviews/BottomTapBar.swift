//
//  BottomTapBar.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct BottomTapBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 60) {
            Spacer()
            BottomTapButton(
                imageName: "house",
                color: .blue,
                isSelected:
                        .constant(tabIndex == 0))
            .onTapGesture {
                onButtonTapped(index: 0)
            }
            BottomTapButton(
                imageName: "magnifyingglass",
                color: .red,
                isSelected:
                        .constant(tabIndex == 1))
            .onTapGesture {
                onButtonTapped(index: 1)
            }
            BottomTapButton(
                imageName: "person",
                color: .yellow,
                isSelected:
                        .constant(tabIndex == 2))
            .onTapGesture {
                onButtonTapped(index: 2)
            }
            Spacer()
        }
        .ignoresSafeArea()
        .padding(.horizontal, 20)
        .frame(height: 120)
        .background(
            LinearGradient(
                colors: [.black, .black.opacity(0.5)],
                startPoint: .bottom,
                endPoint: .top)
        )
        
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct BottomTapBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTapBar(tabIndex: .constant(0))
    }
}

