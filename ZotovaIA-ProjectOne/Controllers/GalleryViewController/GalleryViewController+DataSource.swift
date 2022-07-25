//
//  GalleryViewController+dataSource.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 31.05.2022.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierGallaryCollection, for: indexPath) as? GalleryFriendsCollectionViewCell else {return UICollectionViewCell()}
        cell .configure(image: self.photos[indexPath.item])
        return cell
    
}
}
