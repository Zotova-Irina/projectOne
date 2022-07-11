//
//  NewsViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 08.07.2022.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTitle: UITableView!
    let reuseIdentifierCustomNews = "reuseIdentifierCustomNews"
    var newsNow = [News(text: " Необычная дружба завязалась между питомцами Иркутской зоогалереи. Там в одном вольере друг с другом прекрасно уживаются лев, две тигрицы и лабрадор.", image: UIImage(named: "newsArt")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTitle.register(UINib(nibName: "CustomNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifierCustomNews")
        newsTitle.dataSource = self
        
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfRowsInSection(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsNow.count
    }
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustomNews, for: indexPath) as? CustomNewsTableViewCell else {return UITableViewCell()}
        cell.textNews.text = newsNow[indexPath.row].text
        cell.imageNews.image = newsNow[indexPath.row].image
        return cell
    }
    
}


