//
//  ViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 23.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cleverimageView: UIImageView!
    @IBOutlet weak var lableOne: UILabel!
    @IBOutlet weak var titleLabelPassword: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tupButton(_ sender: UIButton) {
        let login = userName.text
        let password = userPassword.text
    if login == "",
       password == "" {
        performSegue(withIdentifier: "TabBarSegue", sender: self)
    }else {
        showError(massage: "Нправильно введен логин или пароль")
    }
    
            func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
        
    }
    
    @IBAction func viewTapped(_ sender:
        UITapGestureRecognizer) {
        scrollView.endEditing(true)
    }
    
}


