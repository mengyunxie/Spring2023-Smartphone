//
//  ViewController.swift
//  LoginExampleFirebase
//
//  Created by Miya on 3/17/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }

            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                strongSelf.lblStatus.isHidden = false
                return
            }
            strongSelf.performSegue(withIdentifier: "segueDashboard", sender: strongSelf)
        }
    }
}

