//
//  ViewController.swift
//  Hello world
//
//  Created by Miya on 1/17/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickMeAction(_ sender: UIButton) {
        buttonLabel.text = "Hello World"
    }
    
}

