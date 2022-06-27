//
//  FriendsViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 20.05.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromFriendsToGallery = "fromFriendsToGallery"
    var friendsArray = [Friend]()
    
    
    
    func fillFriendsArray() {
        let friendOne = Friend(name: "Бабочка", avatar: UIImage(named: "butterfly")!, photos: [UIImage(named: "butterfly")!, UIImage(named: "natureTree")!])
        let friendTwo = Friend(name: "Волк", avatar: UIImage(named: "wolf")!, photos: [UIImage(named: "wolf")!, UIImage(named: "natureTwo")!])
        let friendTree = Friend(name: "Шрек", avatar: UIImage(named: "shreck")!, photos: [UIImage(named: "shreck")!])
        let friendFour = Friend(name: "Соник", avatar: UIImage(named: "sonic")!, photos: [UIImage(named: "sonic")!])
    
        friendsArray.append(friendOne)
        friendsArray.append(friendTwo)
        friendsArray.append(friendTree)
        friendsArray.append(friendFour)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillFriendsArray()
        
        tableView .register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.source as? FriendsViewController
            let destinationVC = segue.destination as? GalleryViewController
            let friend = sender as? Friend
        destinationVC?.photos = friend!.photos
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromFriendsToGallery, sender: friendsArray[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.configure(friend:friendsArray [indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHight)
    }
    
}







    

