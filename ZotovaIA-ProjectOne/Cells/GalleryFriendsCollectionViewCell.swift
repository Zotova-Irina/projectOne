//
//  PhotoMyFriendsCollectionViewCell.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 24.05.2022.
//

import UIKit

class GalleryFriendsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
    }
    
    func configure(image: UIImage) {
        photoImageView.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
