//
//  CustomTableViewCell.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 20.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tatleLable: UILabel!
  
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
