//
//  ViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 23.04.2022.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var cleverimageView: UIImageView!
    @IBOutlet weak var titleLabelLogin: UILabel!
    @IBOutlet weak var titleLabelPassword: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var clickButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickButton.addTarget(self, action: #selector(didTapOnClickButton), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func didTapOnClickButton () {
    
    
    }

}

