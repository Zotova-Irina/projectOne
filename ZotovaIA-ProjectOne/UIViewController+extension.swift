//
//  UIViewController+extension.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 04.05.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showError(massage: String) {
    let alertVC = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
    let okAktion = UIAlertAction(title: "OK",
                                 style: .default,
                                    handler: nil)
        alertVC.addAction(okAktion)
        present(alertVC, animated: true, completion: nil)
        
}
}
