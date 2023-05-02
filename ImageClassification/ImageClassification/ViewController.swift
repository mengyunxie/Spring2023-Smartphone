//
//  ViewController.swift
//  ImageClassification
//
//  Created by Miya on 4/4/23.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let mlModel = Resnet50().model
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func takeAPic(_ sender: Any) {
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
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        imgView.image = image
        
        // classify the image
        guard let ciiImage = CIImage (image: image) else {return}
        guard let model = try? VNCoreMLModel(for: mlModel) else {return}
        
        let request = VNCoreMLRequest (model: model) { (response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            guard let result = response.results as? [VNClassificationObservation] else {return}
            guard let first = result.first else {return}
            self.lblResult.text = first.identifier
        }
        let handler = VNImageRequestHandler (ciImage: ciiImage)
        
        do{
            try handler.perform([request])
        }
        catch {
            print(error)
        }
    }
}

