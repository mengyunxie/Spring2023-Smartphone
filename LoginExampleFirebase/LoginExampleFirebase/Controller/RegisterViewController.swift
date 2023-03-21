//
//  RegisterViewController.swift
//  LoginExampleFirebase
//
//  Created by Miya on 3/21/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtReenterPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden = true
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        guard let reenterPassword = txtReenterPassword.text else {return}
        
        if email.isEmail == false {
            lblStatus.text = "Enter valid email"
            lblStatus.isHidden = false
            return
        }
        
        if password.isValidPassword == false {
            lblStatus.text = "Enter valid password"
            lblStatus.isHidden = false
            return
        }
        
        if password != reenterPassword {
            lblStatus.text = "Passwords dont match"
            lblStatus.isHidden = false
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.lblStatus.text = error?.localizedDescription
                self.lblStatus.isHidden = false
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}
