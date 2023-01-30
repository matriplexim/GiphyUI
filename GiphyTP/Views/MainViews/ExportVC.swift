//
//  ExportVC.swift
//  GiphyTP
//
//  Created by Максим Ломакин on 29.01.2023.
//

import Foundation
import UIKit
import GiphyUISDK

class ExportVC: UIViewController {
    var url  = ""
    let dismissButton  = UIButton(type: .system)
    let exportButton   = UIButton(type: .system)
    let imgView        = GPHMediaView()
    var dataAsset: Data? = nil
    var imageAsset: UIImage? = nil
    let messageButton  = UIButton(type: .system)
    let chatButton     = UIButton(type: .system)
    let snapchtButton  = UIButton(type: .system)
    let whatsappButton = UIButton(type: .system)
    let instaButton    = UIButton(type: .system)
    let facebookButton = UIButton(type: .system)
    let twitterButton  = UIButton(type: .system)
    let copylinkButton = UIButton(type: .system)
    let copygifButton  = UIButton(type: .system)
    let cancelButton   = UIButton(type: .system)
    let hstack         = UIStackView()
    let presenter      = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configUI()
    }
    
    private func configUI() {
        configDismissButton()
        configExportButton()
        configImgView()
        configCancelButton()
        configCopyGifButton()
        configCopylinkButton()
        configHStack()
        addButtons()
    }
    
    private func configDismissButton() {
        view.addSubview(dismissButton)
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.tintColor = .white
        dismissButton.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
    }
    
    private func configExportButton() {
        view.addSubview(exportButton)
        exportButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        exportButton.tintColor = .white
        exportButton.addTarget(self, action: #selector(tapExportButton), for: .touchUpInside)
        exportButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exportButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            exportButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func configImgView() {
        view.addSubview(imgView)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 30),
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func configCancelButton() {
        view.addSubview(cancelButton)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cancelButton.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configCopyGifButton() {
        view.addSubview(copygifButton)
        copygifButton.setTitle("Copy GIF", for: .normal)
        copygifButton.setTitleColor(.white, for: .normal)
        copygifButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        copygifButton.backgroundColor = .systemGray6
        copygifButton.addTarget(self, action: #selector(tapCopyGifButton), for: .touchUpInside)
        copygifButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            copygifButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -10),
            copygifButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            copygifButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            copygifButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            copygifButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configCopylinkButton() {
        view.addSubview(copylinkButton)
        copylinkButton.setTitle("Copy GIF Link", for: .normal)
        copylinkButton.setTitleColor(.white, for: .normal)
        copylinkButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        copylinkButton.backgroundColor = .systemIndigo
        copylinkButton.addTarget(self, action: #selector(tapCopyLinkButton), for: .touchUpInside)
        copylinkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            copylinkButton.bottomAnchor.constraint(equalTo: copygifButton.topAnchor, constant: -10),
            copylinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            copylinkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            copylinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            copylinkButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configHStack() {
        view.addSubview(hstack)
        hstack.axis = .horizontal
        hstack.spacing = 4
        hstack.distribution = .fillEqually
        hstack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hstack.bottomAnchor.constraint(equalTo: copylinkButton.topAnchor, constant: -10),
            hstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            hstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            hstack.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func addButtons() {
        hstack.addArrangedSubview(messageButton)
        hstack.addArrangedSubview(chatButton)
        hstack.addArrangedSubview(snapchtButton)
        hstack.addArrangedSubview(whatsappButton)
        hstack.addArrangedSubview(instaButton)
        hstack.addArrangedSubview(facebookButton)
        hstack.addArrangedSubview(twitterButton)
        
        messageButton.setImage(UIImage(named: "message"), for: .normal)
        chatButton.setImage(UIImage(named: "chat"), for: .normal)
        snapchtButton.setImage(UIImage(named: "snpchat"), for: .normal)
        whatsappButton.setImage(UIImage(named: "whatsapp"), for: .normal)
        instaButton.setImage(UIImage(named: "insta"), for: .normal)
        facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
        twitterButton.setImage(UIImage(named: "twitter"), for: .normal)
    }
    
    @objc func tapDismissButton() {
        GPHCache.shared.clear()
        self.dismiss(animated: true)
    }
    
    @objc func tapExportButton() {
        guard dataAsset != nil else {
            presenter.showAlert(sender: self, title: "Export Error", message: "Data is loading. Please wait")
            return
        }
        presenter.shareAction(sender: self, data: dataAsset as Any)
    }
    
    @objc func tapCopyLinkButton() {
        let url = URL(string: self.url)
        UIPasteboard.general.url = url
    }
    
    @objc func tapCopyGifButton() {
        guard dataAsset != nil else {
            presenter.showAlert(sender: self, title: "Export Error", message: "Data is loading. Please wait")
            return
        }
        let gifImage = UIImage.animatedGif(from: dataAsset!)
        UIPasteboard.general.image = gifImage
    }
}

