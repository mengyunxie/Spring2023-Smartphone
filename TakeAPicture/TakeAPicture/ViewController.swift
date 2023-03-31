//
//  ViewController.swift
//  TakeAPicture
//
//  Created by Miya on 3/31/23.
//

import UIKit
import QRCodeScanner

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, QRCodeScanViewControllerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var IblScannedText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scanQRCodeAction(_ sender: Any) {
        // Create an instance of QRCodeScanViewController
        let viewController = QRCodeScanViewController.create()
        
        // Set itself as delegate
        viewController.delegate = self
                
        // Present the view controller
        self.present(viewController, animated: true)
    }
    
    func qrCodeScanViewController(_ viewController: QRCodeScanner.QRCodeScanViewController, didScanQRCode value: String) {
        viewController.dismiss(animated: true) {
            self.IblScannedText.text = value
        }
    }
    
    @IBAction func takeAPictureAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a picture", message: "Show Time", preferredStyle: .alert)
        
        let cameraAction  = UIAlertAction(title: "Camera", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.image = image
        }
        picker.dismiss(animated: true)
    }
}

