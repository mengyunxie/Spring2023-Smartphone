//
//  UploadImageViewController.swift
//  FinalProject
//
//  Created by Miya on 4/22/23.
//

import UIKit
import CoreLocation
import RealmSwift

class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    let realm  = try! Realm()
    
    var uploadProtocol: UploadImageProtocol?
    let locationManager = CLLocationManager()
    
    // For location
    var imgAddress = ""

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var txtTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        startSignificantLocationChange()
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
            self.imgView.image = image
        }
        
        picker.dismiss(animated: true)
        
    }
    
    
    @IBAction func uploadImageAction(_ sender: Any) {
        
        // Get Location, put it to imgAddress
        self.locationManager.requestLocation()
        
        // Set for default image
        let defaultImage = UIImage(systemName: "photo")
                        
        guard let img = imgView.image else {return}
        guard let title = txtTitle.text else {return}
        
        // Resize image size before store to LocalDB
        let newSizeImg = resizeImage(image: img)
        let imageData: Data? = newSizeImg.pngData()
        
        let newImgData: ImageCellData = ImageCellData()
        newImgData.title = title
        newImgData.location = imgAddress
        newImgData.image = imageData
       
        // Add to the LocalDB
        addDataToRealmDB(imgData: newImgData)
        
        uploadProtocol?.uploadedImageDelegate(img: img, imgLocation: imgAddress, imgTitle: title)
        
        // Switch to homeVC
        self.tabBarController?.selectedIndex = 0
        
        // Reset
        imgView.image = defaultImage
        //imgAddress = ""
        txtTitle.text = ""
    }
    
    // Resize the image size
    func resizeImage(image: UIImage) -> UIImage {
        let newSize: CGSize = CGSizeMake(100.0,100.0)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func addDataToRealmDB(imgData : ImageCellData) {
        do {
            try self.realm.write {
                self.realm.add(imgData, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add values to the DB \(error)")
        }
    }
    
    func startSignificantLocationChange(){
        
        if CLLocationManager.significantLocationChangeMonitoringAvailable(){
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
        }
        
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
                address += place.postalCode!
            }
            self.imgAddress = address
        }
    }
}
