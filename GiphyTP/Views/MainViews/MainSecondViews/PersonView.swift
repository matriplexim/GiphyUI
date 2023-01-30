//
//  PersonView.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct PersonView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            Text("PersonView")
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
