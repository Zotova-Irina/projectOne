//
//  BigPhotoViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 27.07.2022.
//

import UIKit

class BigPhotoViewController: UIViewController {
    
    @IBOutlet weak var bigPhotoFriend: UIImageView! {
  didSet {
        bigPhotoFriend.isUserInteractionEnabled = true
    }
    }
    enum AnimationDirection {
        case left
        case right
    }
    
    var animationDirection: AnimationDirection = .left
    let additionalImageView = UIImageView()
    var photo = [UIImage] ()
    var selectedPhotoIndex: Int = 0
    var propertyAnimator: UIViewPropertyAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photo.isEmpty else {return}
        
        bigPhotoFriend.image = photo[selectedPhotoIndex]
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe))
        leftSwipe.direction = .left
        bigPhotoFriend.addGestureRecognizer(leftSwipe)
        view.addSubview(additionalImageView)
        view.sendSubviewToBack(additionalImageView)
        additionalImageView.translatesAutoresizingMaskIntoConstraints = false
        additionalImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            additionalImageView.leadingAnchor.constraint(equalTo: bigPhotoFriend.leadingAnchor),
            additionalImageView.trailingAnchor.constraint(equalTo: bigPhotoFriend.trailingAnchor),
            additionalImageView.topAnchor.constraint(equalTo: bigPhotoFriend.topAnchor),
            additionalImageView.bottomAnchor.constraint(equalTo: bigPhotoFriend.bottomAnchor)
        ])
        
        let panGR = UIGestureRecognizer(target: self, action: #selector(viewPanned))
        view.addGestureRecognizer(panGR)
    }
    
    @objc func viewPanned(_ panGestureRec: UIGestureRecognizer) {
        switch panGestureRec.state {
        case.began:
            if panGestureRec.translation(in: view).x > 0 {
                
                guard selectedPhotoIndex >= 1 else {return}
                animationDirection = .right
                self.additionalImageView.transform = CGAffineTransform(translationX: -1.5 * self.additionalImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                self.additionalImageView.image = self.photo[self.selectedPhotoIndex - 1]
                propertyAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                          curve: .easeInOut,
                                                          animations: {
                    
                    self.bigPhotoFriend.transform = CGAffineTransform(translationX: 1.5 * self.bigPhotoFriend.bounds.width, y: -200).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                    self.additionalImageView.transform = .identity
                })
                
                propertyAnimator.addCompletion { position in
                    switch position {
                    case .end:
                        self.selectedPhotoIndex -= 1
                        self.bigPhotoFriend.image = self.photo[self.selectedPhotoIndex]
                        self.bigPhotoFriend.transform = .identity
                        self.additionalImageView.image = nil
                    case .start:
                        self.additionalImageView.transform = CGAffineTransform(translationX: -1.5 * self.additionalImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                    case .current:
                        break
                    @unknown default:
                        break
                    }
                    
                }
                
            } else {
                
                guard selectedPhotoIndex < photo.count - 1 else {return}
                animationDirection = .left
                self.additionalImageView.transform = CGAffineTransform(translationX: 1.5 * self.additionalImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                self.additionalImageView.image = self.photo[self.selectedPhotoIndex + 1]
                propertyAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                          curve: .easeInOut,
                                                          animations: {
                    
                    self.bigPhotoFriend.transform = CGAffineTransform(translationX: -1.5 * self.bigPhotoFriend.bounds.width, y: -200).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                    self.additionalImageView.transform = .identity
                })
                
                propertyAnimator.addCompletion { position in
                    switch position {
                    case .end:
                        self.selectedPhotoIndex += 1
                        self.bigPhotoFriend.image = self.photo[self.selectedPhotoIndex]
                        self.bigPhotoFriend.transform = .identity
                        self.additionalImageView.image = nil
                    case .start:
                        self.additionalImageView.transform = CGAffineTransform(translationX: 1.5 * self.additionalImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                    case .current:
                        break
                    @unknown default:
                        break
                    }
                    
                }
                
            }
        case.changed:
            switch animationDirection {
            case.right:
                let precent = min(max(0, panGestureRec.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = precent
            case.left:
                let precent = min(max(0,-panGestureRec.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = precent
            }
        case.ended:
            if propertyAnimator.fractionComplete > 0.6 {
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            } else {
                propertyAnimator.isReversed = true
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            }
        default: break
        }
        
    }
    
    @objc func leftSwipe() {
        guard selectedPhotoIndex < photo.count - 1 else {return}
        
        additionalImageView.transform = CGAffineTransform(scaleX: 1.5 * additionalImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
        additionalImageView.image = photo[selectedPhotoIndex + 1]
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseOut) {
            self.bigPhotoFriend.transform = CGAffineTransform(translationX: -1.5 * self.bigPhotoFriend.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            self.additionalImageView.transform = .identity
        } completion: { _ in
            self.selectedPhotoIndex += 1
            self.bigPhotoFriend.image = self.photo[self.selectedPhotoIndex]
            self.bigPhotoFriend.transform = .identity
            self.additionalImageView.image = nil
        }
        
    }
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        guard selectedPhotoIndex >= 1 else {return}
        
        additionalImageView.transform = CGAffineTransform(scaleX: -1.5 * additionalImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
        additionalImageView.image = photo[selectedPhotoIndex - 1]
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseOut) {
            self.bigPhotoFriend.transform = CGAffineTransform(translationX: 1.5 * self.bigPhotoFriend.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            self.additionalImageView.transform = .identity
        } completion: { _ in
            self.selectedPhotoIndex -= 1
            self.bigPhotoFriend.image = self.photo[self.selectedPhotoIndex]
            self.bigPhotoFriend.transform = .identity
            self.additionalImageView.image = nil
        }
        
    }
    
    
    
}
