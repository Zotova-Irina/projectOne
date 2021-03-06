//
//  CustomTableViewCell.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 20.05.2022.
//

import UIKit

@IBDesignable class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tatleLable: UILabel!
    @IBOutlet weak var backView: UIView!

    
    override func prepareForReuse() {
        avatarImageView.image = nil
        tatleLable.text = nil
    }
    
    func configure(friend: Friend) {
        avatarImageView.image = friend.avatar
        tatleLable.text = friend.name
    }
    
    func configure(group: Group) {
        avatarImageView.image = group.avatar
        tatleLable.text = group.title
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = CGFloat(avatarImageView.bounds.height/2)
        avatarImageView.layer.borderWidth = 0.5
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        backView.layer.cornerRadius = CGFloat(backView.bounds.height/2)
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 10
        backView.layer.shadowOpacity = 0.8

    }
    

    @IBAction func tapButtonAvatar(_ sender: Any) {
        UIView.animate(withDuration: 0.3,
                               delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: [.curveEaseOut ]) { [weak self] in
            self!.avatarImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                } completion: { _ in
                }
    
    
    }
   
    
    
    
    @IBInspectable var cornerRadius: CGFloat {
                set { layer.cornerRadius = newValue  }
                get { return layer.cornerRadius }
            }
        @IBInspectable var borderWidth: CGFloat {
            set { layer.borderWidth = newValue }
            get { return layer.borderWidth }
        }
        @IBInspectable var borderColor: CGColor {
            set { layer.borderColor = newValue }
            get { return layer.borderColor! }
    }
        @IBInspectable var shadowOffset: CGSize {
            get { return layer.shadowOffset }
            set { layer.shadowOffset = newValue  }
        }
        @IBInspectable var shadowOpacity: Float {
            set { layer.shadowOpacity = newValue }
            get { return layer.shadowOpacity }
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
