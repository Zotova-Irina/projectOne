//
//  BigPhotoViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 27.07.2022.
//

import UIKit

class BigPhotoViewController: UIViewController {

    @IBOutlet weak var bigPhotoFriend: UIImageView!
    
    var photo = [UIImage] ()
    var selectedPhotoIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard photo.isEmpty else {return}
        
        bigPhotoFriend.image = photo[selectedPhotoIndex]

    }
    

    

}
