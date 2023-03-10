//
//  SecondViewController.swift
//  ProtocolsAndDelegateExample
//
//  Created by Miya on 3/10/23.
//

import UIKit

class SecondViewController: UIViewController {

    var setStatusDelegate: SetStatusDelegate?
    
    var name = ""
    @IBOutlet weak var lblWelcome: UILabel!
    
    @IBOutlet weak var txtStatus: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Welcome \(name)"
    }
    
    @IBAction func setStatusAction(_ sender: Any) {
        guard let status = txtStatus.text else {return}
        
        // Call the protocol function
        setStatusDelegate?.setStatus(status: status)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
