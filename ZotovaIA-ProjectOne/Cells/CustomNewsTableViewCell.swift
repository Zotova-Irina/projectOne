//
//  CustomNewsTableViewCell.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 05.07.2022.
//

import UIKit

class CustomNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var heartButtonNews: UIButton!
    @IBOutlet weak var countClickNews: UILabel!
    @IBOutlet weak var countMassangerNews: UILabel!
    @IBOutlet weak var massangerButtonNews: UIButton!
    @IBOutlet weak var countEyeNews: UILabel!
    @IBOutlet weak var eyeButtonNews: UIButton!
    @IBOutlet weak var countArrowshapeNews: UILabel!
    @IBOutlet weak var arrowshapeButtonNews: UIButton!
    
    
    
    var likeEnableNews = false
    var counterNews = 0
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageNews.image = nil
        textNews.text = nil
        likeEnableNews = false
        heartButtonNews.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    func configure(news: News) {
        imageNews.image = news.image
        textNews.text = news.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func pressHeartButtonNews(_ sender: Any) {
        guard let button = sender as? UIButton else {return}
        if likeEnableNews {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            counterNews -= 1
            countClickNews.text = String(counterNews)
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            counterNews += 1
            countClickNews.text = String(counterNews)
        }
        likeEnableNews = !likeEnableNews
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
