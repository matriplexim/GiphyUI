//
//  GridVC.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 28.01.2023.
//

import UIKit
import GiphyUISDK

class GridVC: UIViewController {

    let gridController = GiphyGridController()

    override func viewDidLoad() {
        super.viewDidLoad()
        gridController.delegate = self
        configGridController()
        addGridController()
        configGridContent()
    }
    
    private func configGridController() {
        Giphy.configure(apiKey: Constants().API_KEY)
        gridController.cellPadding = 2.0
        gridController.direction = .vertical
        gridController.numberOfTracks = 2
    }
    
    private func addGridController() {
        addChild(gridController)
        view.addSubview(gridController.view)
        gridController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridController.view.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 50),
            gridController.view.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            gridController.view.leftAnchor.constraint(equalTo: view.safeLeftAnchor),
            gridController.view.rightAnchor.constraint(equalTo: view.safeRightAnchor)
        ])
        gridController.didMove(toParent: self)
    }
    
    private func configGridContent() {
        gridController.content = GPHContent.trendingGifs
        gridController.renditionType = .fixedWidthSmall
        gridController.update()
    }
}

extension GridVC: GPHGridDelegate {
    
    func contentDidUpdate(result: Result<Int, Error>) {
        
    }
    
    func didSelectMedia(media: GiphyUISDK.GPHMedia, cell: UICollectionViewCell) {
        let vc = ExportVC()
        guard let url = media.url(rendition: .downsizedMedium, fileType: .gif) else {
            print("Wrong URL for export")
            return
        }
        vc.url = url
        vc.imgView.media = media
        GPHCache.shared.downloadAssetData(url) { data, error in
            if data != nil && error == nil {
                vc.imageAsset = UIImage.animatedGif(from: data!)
                vc.dataAsset = data!
            }
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func didSelectMoreByYou(query: String) {
        
    }
    
    func didScroll(offset: CGFloat) {
        
    }
}
