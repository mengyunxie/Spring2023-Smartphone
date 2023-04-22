//
//  TabBarViewController.swift
//  InstaWithUITestAndXib
//
//  Created by Miya on 4/21/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = viewControllers?[0] as! HomeViewController
        let uploadImageVC = viewControllers?[1] as! UploadImageViewController
        uploadImageVC.uploadProtocol = homeVC.self
    }
    
}
