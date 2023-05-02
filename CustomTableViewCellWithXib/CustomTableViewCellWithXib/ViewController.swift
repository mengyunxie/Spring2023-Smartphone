//
//  ViewController.swift
//  CustomTableViewCellWithXib
//
//  Created by Miya on 2/24/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.imgContainer.image = UIImage(named: "food\(indexPath.row)")
        cell.lblImage.text = "Food \(indexPath.row)"

        return cell
    }
}
