//
//  ViewController.swift
//  LocalizationExample
//
//  Created by Miya on 3/30/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHelloWord: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHelloWord.text = helloWorld;
    }


}

