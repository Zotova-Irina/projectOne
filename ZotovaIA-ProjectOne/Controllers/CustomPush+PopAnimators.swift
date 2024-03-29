//
//  CustomPush+PopAnimators.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 01.08.2022.
//

import UIKit

class PushAnimator: NCObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {return}
          guard  let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
        
        
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.75,
                               animations: {
                let translation = CGAffineTransform(translationX: -200, y: 0)
                let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                source.view.transform = translation.concatenating(scale)
            })
        
            UIView.addKeyframe(withRelativeStartTime: 0.2,
                               relativeDuration: 0.4,
                               animations: {
                let translation = CGAffineTransform(translationX: source.view.frame.width/2,
                                                    y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                destination.view.transform = translation.concatenating(scale)
            })
            
        UIView.addKeyframe(withRelativeStartTime: 0.6,
                           relativeDuration: 0.4,
                           animations: {
                destination.view.transform = .identity
            })
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0,
                       options: .calculationModePaced) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.75) {
                let translation = CGAffineTransform(translationX: -200, y: 0)
                let scale  = CGAffineTransform(scaleX: 0.8, y: 0.8)
                source.view.transform = translation.concatenating(scale)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2,
                               relativeDuration: 0.4,
                               animations: {
                let translation = CGAffineTransform(translationX: cource.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1,2)
                destination.view.transform = translation.concatenating(scale)
        })
            UIView.addKeyframe(withRelativeStartTime: 0.6,
                               relativeDuration: 0.4,
                               animations: {
                destination.view.transform = .identity
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}

class PopAnimator: NCObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {return}
            let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
    
        destination.view.frame = source.view.frame
        
        let translation = CGAffineTransform(translationX: -200, y: 0)
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        destination.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.4,
                               animations: {
                let translation  = CGAffineTransform(translationX: cource.view?.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                source.view.transform = translation.concatenating(scale)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4,
                               relativeDuration: 0.4,
                               animations: {
                source.view.transform = CGAffineTransform(translationX: source.view.frame.width,
                                                          y: 0)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.75) {
                destination.view.transform = .identity
            })
            
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
