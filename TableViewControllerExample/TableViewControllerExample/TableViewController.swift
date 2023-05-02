//
//  TableViewController.swift
//  TableViewControllerExample
//
//  Created by Miya on 2/23/23.
//

import UIKit

class TableViewController: UITableViewController {

    let friends = ["Tom", "Bill", "Rose", "Jim", "Mark", "Mary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = friends[indexPath.row]
        return cell
    }
}
