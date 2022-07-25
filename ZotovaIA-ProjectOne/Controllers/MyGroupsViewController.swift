//
//  MyGroupViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 20.05.2022.
//

import UIKit

class MyGroupViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifierCustomMyGroup = "reuseIdentifierCustomMyGroup"
    var myGroupsArray = [Group]()
    let fromAllGroupsToMyGroupsSegue = "fromAllGroupsToMyGroups"
    
    func fillMyGroupArray() {
        let groupOne = Group(title: "Зоогруппа", avatar: UIImage(named: "animals")!)
        let groupTwo = Group(title: "Спортактив", avatar: UIImage(named: "sport")!)
        let groupTree = Group(title: "Изостудия", avatar: UIImage(named: "art")!)
        
        myGroupsArray.append(groupOne)
        myGroupsArray.append(groupTwo)
        myGroupsArray.append(groupTree)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillMyGroupArray()
        
        tableView .register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustomMyGroup)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func isItemAlreadyInArray(group:Group) -> Bool {
        return myGroupsArray.contains{sourceGroup in
            sourceGroup.title == group.title
        }
    }
    
    @IBAction func unwinSegueToMyGroup(segue: UIStoryboardSegue) {
        if segue.identifier == fromAllGroupsToMyGroupsSegue {
           let sourseVC = segue.source as? AllGroupsViewController
            let selectedGroup = (sourseVC?.selectedGroup as? Group)!
            do {
                if isItemAlreadyInArray(group: selectedGroup) {return}
            self.myGroupsArray.append(selectedGroup)
            self.tableView.reloadData()
        }

    }
}
}
extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustomMyGroup, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.configure(group: myGroupsArray [indexPath.row])
        return cell
    }
    
}


