//
//  Presenter.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 29.01.2023.
//

import Foundation
import UIKit

class Presenter {
    func shareAction(sender: UIViewController, data: Any) {
            var items: [Any] = []
            items.append(data)
            let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
            sender.present(avc, animated: true)
        }
    
    func showAlert(sender: UIViewController, title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        sender.present(alert, animated: true)
    }
}
