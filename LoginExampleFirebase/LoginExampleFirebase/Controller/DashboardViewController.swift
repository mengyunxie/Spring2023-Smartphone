//
//  DashboardViewController.swift
//  LoginExampleFirebase
//
//  Created by Miya on 3/17/23.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logoutAction(_ sender: Any) {
        let keyChain = KeychainService()
        keyChain.keyChain.clear()
        self.navigationController?.popViewController(animated: true)
    }
}
