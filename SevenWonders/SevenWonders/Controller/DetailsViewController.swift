//
//  DetailsViewController.swift
//  SevenWonders
//
//  Created by Miya on 3/18/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var details = ""

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = details
    }


}
