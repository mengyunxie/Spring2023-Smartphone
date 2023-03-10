//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Miya on 3/10/23.
//

import UIKit

class ViewController: UIViewController {

    var txtField: UITextField?
    
    @IBOutlet weak var lblStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showAlertController(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert Controller Title", message: "AlertController message", preferredStyle: .alert)

        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            self.lblStock.text = self.txtField?.text
        }
        
        let cancelButton = UIAlertAction (title: "Cancel", style: .cancel){ action in
        }
        
        alertController.addTextField{ lblTextField in
            self.txtField = lblTextField
            lblTextField.placeholder = "Enter Stock Value"
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true)
    }
}

