//
//  GalleryViewController+dataSource.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 31.05.2022.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friendsImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoSell", for: indexPath) as? PhotosFriendsCollectionViewCell
        cell!.friendsPhoto.image = friendsImage[indexPath.item]
        return cell!
    
}
}

extension GalleryViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBigPhoto",
           let selectedPhoto = collectionView.indexPathsForSelectedItems?.first,
           let bigPhotoVC = segue.destination as? BigPhotoViewController {
            bigPhotoVC.photo = friendsImage
            bigPhotoVC.selectedPhotoIndex = selectedPhoto.item
        }
    }
}
