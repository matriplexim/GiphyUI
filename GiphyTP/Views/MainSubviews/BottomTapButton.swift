//
//  BottomTapButton.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct BottomTapButton: View {
    let imageName: String
    let color: Color
    @Binding var isSelected: Bool
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(color)
                .shadow(color: color,radius: 3)
            if isSelected {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(color)
                    .shadow(color: color,radius: 3)
            }
        }
    }
}

struct BottomTapButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomTapButton(imageName: "house", color: .black, isSelected: .constant(true))
    }
}

