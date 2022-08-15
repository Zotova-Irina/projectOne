//
//  FriendsViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 20.05.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    let fromFriendsToGallery = "fromFriendsToGallery"
    var friendsArray = [Friend]()
    var savedFriendsArray = [Friend]()
    
    
    
    
    func fillFriendsArray() {
        let friendOne = Friend(name: "Бабочка", avatar: UIImage(named: "butterfly")!, photos: [UIImage(named: "butterfly")!, UIImage(named: "natureTree")!, UIImage(named: "природа3")!])
        let friendTwo = Friend(name: "Волк", avatar: UIImage(named: "wolf")!, photos: [UIImage(named: "wolf")!, UIImage(named: "natureTwo")!, UIImage(named: "природа2")!])
        let friendTree = Friend(name: "Шрек", avatar: UIImage(named: "shreck")!, photos: [UIImage(named: "shreck")!, UIImage(named: "природа1")!])
        let friendFour = Friend(name: "Соник", avatar: UIImage(named: "sonic")!, photos: [UIImage(named: "sonic")!, UIImage(named: "природа4")!])
        
        friendsArray.append(friendOne)
        friendsArray.append(friendTwo)
        friendsArray.append(friendTree)
        friendsArray.append(friendFour)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    //MARK: Массив друзей и массив первых букв
    
    func arrayLetter (sourceArray: [Friend]) -> [String] {
        var resultArray = [String]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1))
            if !resultArray.contains(nameLetter.lowercased()) {
                resultArray.append(nameLetter.lowercased())
            }
        }
        return resultArray.sorted {firstItem, secondItem in
            firstItem < secondItem
        }
    }
    //MARK: Массив по схожей букве
    
    func arrayByLetter (sourceArray: [Friend], letter: String) -> [Friend] {
        var resultArray = [Friend]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1).lowercased())
            if nameLetter == letter.lowercased() {
                resultArray.append(item)
            }
        }
        return resultArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        savedFriendsArray = friendsArray
        
        tableView .register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFriendsToGallery",
        let allPhotoVC = segue.destination as? GalleryViewController,
        let selectedCellIndexPath = tableView.indexPathForSelectedRow {
            let selectedFriend = friendsArray[selectedCellIndexPath.row]
            allPhotoVC.friendsImage = selectedFriend.photos
        }
    }
        }
//        _ = segue.source as? FriendsViewController
//        let destinationVC = segue.destination as? GalleryViewController
//        let friend = sender as? Friend
//        destinationVC?.friendsImage = friend!.photos

    


extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Сколько букв, столько и секций
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayLetter(sourceArray: friendsArray).count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromFriendsToGallery, sender: friendsArray[indexPath.row])
    }
    // Сколько элементов в массиве на определенную букву
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayByLetter(sourceArray: friendsArray, letter: arrayLetter(sourceArray: friendsArray)[section]).count
    }
    // Конфигурируется ячейка
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.configure(friend: arrayByLetter(sourceArray: friendsArray, letter: arrayLetter(sourceArray: friendsArray)[indexPath.section])[indexPath.row])
        return cell
    }
    // Отображение буквы
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayLetter(sourceArray: friendsArray)[section].uppercased()
    }
}

extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.friendsArray = self.savedFriendsArray
        } else {
            self.friendsArray = self.friendsArray.filter({friendsItem in friendsItem.name.lowercased().contains(searchText.lowercased())
                
            })
        }
        self.tableView.reloadData()
    }
}

