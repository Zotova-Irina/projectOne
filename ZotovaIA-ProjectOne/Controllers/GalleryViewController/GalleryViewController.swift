//
//  GalleryViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 24.05.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var reuseIdentifierGallaryCollection = "reuseIdentifierGallaryCollection"

    
    var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GalleryFriendsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierGallaryCollection)
    }
}
