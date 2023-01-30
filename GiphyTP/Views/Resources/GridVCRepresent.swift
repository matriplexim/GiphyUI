//
//  GridVCRepresent.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import SwiftUI

struct GridVCRepresent: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = GridVC()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
