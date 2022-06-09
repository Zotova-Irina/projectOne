//
//  GalleryViewController+FlowLayout.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 02.06.2022.
//

import UIKit

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewWidth = collectionView.bounds.width
    let wihtSpace = CGFloat(5)
    let lineCountCell = CGFloat(2)
    let cellWidth = collectionViewWidth / lineCountCell - wihtSpace
    return CGSize(width: cellWidth, height: cellWidth)
}
}
