//
//  ViewController.swift
//  TwoTables
//
//  Created by Miya on 2/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let resturants = ["Boiling Point", "Din Tai Fung", "Dong Ting Chun", "Dough Zone", "Gyu-Kaku Japanese BBQ", "Hot Pot", "Tian Fu", "Roti", "Zaika", "Zeeks Pizza"]
    let food = ["Appetizers", "Main Courses", "Dessert", "Salads", "Drinks", "Sides"]

    @IBOutlet weak var tableViewTop: UITableView!
    
    @IBOutlet weak var tableViewBottom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewTop.delegate = self
        tableViewTop.dataSource = self
        
        tableViewBottom.delegate = self
        tableViewBottom.dataSource = self
        
        // The first row of tableViewTop is selected by default
        tableViewTop.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition(rawValue: 0)!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewTop {
            return resturants.count
        } else {
            return food.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewTop {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = resturants[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            // Get the current selected row of tableViewTop
            let indexPathForSelectedRow = (self.tableViewTop.indexPathForSelectedRow?.row)!
            
            cell.textLabel?.text = "\(resturants[indexPathForSelectedRow]) : \(food[indexPath.row])"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Selecting a row of tableViewTop will update the data of tableViewBottom
        if tableView == tableViewTop {
            self.tableViewBottom.reloadData()
        }
    }

}

