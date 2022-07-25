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
    @IBOutlet weak var viewLoadingOne: UIView!
    @IBOutlet weak var viewLoadingTwo: UIView!
    @IBOutlet weak var viewLoadingTree: UIView!
    
    
    
    func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.6
        
        viewLoadingOne.layer.cornerRadius = CGFloat(viewLoadingOne.bounds.height/2)
        viewLoadingTwo.layer.cornerRadius = CGFloat(viewLoadingTwo.bounds.height/2)
        viewLoadingTree.layer.cornerRadius = CGFloat(viewLoadingTree.bounds.height/2)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addShadow(view: userName)
        addShadow(view: userPassword)
    }
//    func loadingViewController (){
//
//        UIView.animate(
//            withDuration: 0.7,
//            delay: 0,
//            options: [.repeat, .autoreverse]) { [weak self] in
//                self?.viewLoadingOne.alpha = 1
//            } completion: { _ in }
//
//        UIView.animate(
//            withDuration: 0.7,
//            delay: 0.3,
//            options: [.repeat, .autoreverse]) { [weak self] in
//                self?.viewLoadingTwo.alpha = 1
//            } completion: { _ in }
//        UIView.animate(
//            withDuration: 0.7,
//            delay: 0.6,
//            options: [.repeat, .autoreverse]) { [weak self] in
//                self?.viewLoadingTree.alpha = 1
//            } completion: { _ in }
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewLoadingOne.alpha = 0
        viewLoadingTwo.alpha = 0
        viewLoadingTree.alpha = 0
    }
    
    @IBAction func tupButton(_ sender: UIButton) {
        
        let login = userName.text
        let password = userPassword.text
        
        if login == "",
           password == "" {
//            performSegue(withIdentifier: "TabBarSegue", sender: self)
            
        } else {
            showError(massage: "Нправильно введен логин или пароль")
        }
        
        
        _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { timer in
            self.performSegue(withIdentifier: "TabBarSegue", sender: nil)
    })
        func loadingViewController (){
            UIView.animate(
            withDuration: 0.7,
            delay: 0,
            options: [.repeat, .autoreverse]) { [weak self] in
                self?.viewLoadingOne.alpha = 1
            } completion: { _ in }

        UIView.animate(
            withDuration: 0.7,
            delay: 0.3,
            options: [.repeat, .autoreverse]) { [weak self] in
                self?.viewLoadingTwo.alpha = 1
            } completion: { _ in }
        UIView.animate(
            withDuration: 0.7,
            delay: 0.6,
            options: [.repeat, .autoreverse]) { [weak self] in
                self?.viewLoadingTree.alpha = 1
            } completion: { _ in }
    }
            loadingViewController()
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
    
        func viewTapped(_ sender:
                              UITapGestureRecognizer) {
        scrollView.endEditing(true)
        
    }
}
}


