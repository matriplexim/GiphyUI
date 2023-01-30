//
//  TopTapButton.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct TopTapButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        ZStack {
            Text(text)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(isSelected ? Color.purple : nil)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}

struct TopTapButton_Previews: PreviewProvider {
    static var previews: some View {
        TopTapButton(text: "Trending", isSelected: .constant(true))
    }
}

