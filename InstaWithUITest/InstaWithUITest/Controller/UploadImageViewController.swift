//
//  UploadImageViewController.swift
//  InstaWithUITest
//
//  Created by Miya on 4/21/23.
//

import UIKit
import CoreLocation
import Photos

class UploadImageViewController: UIViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var uploadProtocol: UploadImageProtocol?
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var lblLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
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
                self.locationManager.requestLocation()
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
        
        // For image location
        // guard let asset = info[.phAsset] as? PHAsset else { return }
        //print(asset?.location ?? "None")
        
        picker.dismiss(animated: true)
        
    }
    
    @IBAction func uploadImageAction(_ sender: Any) {
        let defaultImage = UIImage(systemName: "photo")
        
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
        
        if img == defaultImage || location == "Image Location" || title == "" {
            print("Enter all values!")
            return
        }
        
        uploadProtocol?.uploadedImageDelegate(img: img, imgLocation: location, imgTitle: title)
        
        // Switch to homeVC
        self.tabBarController?.selectedIndex = 0
        
        // reset
        imgView.image = defaultImage
        lblLocation.text = "Image Location"
        txtTitle.text = ""
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        getAddressFromLocation(location: location)
    }
    
    func getAddressFromLocation(location: CLLocation) {
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            if error != nil {
                print(error as Any)
                return
            }
            var address = ""
            guard let place = placemarks?.first else {return}
            if place.name != nil {
                address += place.name! + ","
            }
            if place.locality != nil {
                address += place.locality! + ","
            }
            if place.subLocality != nil {
                address += place.subLocality! + ","
            }
            if place.country != nil {
                address += place.country! + ","
            }
            if place.postalCode != nil {
                address += place.postalCode! + ","
            }
            self.lblLocation.text = address
        }
    }
}
