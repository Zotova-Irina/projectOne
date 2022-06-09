//
//  AllGroupViewController.swift
//  ZotovaIA-ProjectOne
//
//  Created by Irina on 21.05.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {
    @IBOutlet weak var allGroup: UITableView!

    let reuseIdentifierCustomAllGroup = "reuseIdentifierCustomAllGroup"
    var allGroupsArray = [Group]()
    let fromAllGroupsToMyGroupsSegue = "fromAllGroupsToMyGroups"
    var selectedGroup: Group?
    
    
    func fillAllGroupArray() {
        let group1 = Group(title: "group1", avatar: UIImage(named: "natureOne")!)
        allGroupsArray.append(group1)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        allGroup.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillAllGroupArray()
        
        allGroup.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierCustomAllGroup)
        allGroup.delegate = self
        allGroup.dataSource = self
    }
    }
    
extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustomAllGroup, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
                cell.configure(group: allGroupsArray [indexPath.row])
                return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = allGroupsArray[indexPath.row]
        performSegue(withIdentifier: fromAllGroupsToMyGroupsSegue, sender: nil)
    }
}
    
    
    

