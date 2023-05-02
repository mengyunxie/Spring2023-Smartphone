//
//  ViewController.swift
//  SegueExample
//
//  Created by Miya on 3/8/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSecondVCAction(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            guard let name = txtName.text else {return}
            secondVC.welcomeName = name
        }
    }
    
}
