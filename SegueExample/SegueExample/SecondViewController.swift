//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Miya on 3/8/23.
//

import UIKit

class SecondViewController: UIViewController {

    var welcomeName = ""
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Welcome \(welcomeName)"
    }
    
}
