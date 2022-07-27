//
//  BigPhotoViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 27.07.2022.
//

import UIKit

class BigPhotoViewController: UIViewController {

    @IBOutlet weak var bigPhotoFriends: BigPhotoCell!
    var photos = [UIImage]()
    var selectedPhotoIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard photos.isEmpty else {return}
        
    
    }
    
}
