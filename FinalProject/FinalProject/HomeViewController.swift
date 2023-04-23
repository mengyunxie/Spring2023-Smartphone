//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Miya on 4/22/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    
    let realm  = try! Realm()
    
    var images : [UIImage] = [UIImage]()
    var imagesLocations = [String]()
    var imagesTitles : [String] = [String]()

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Local Data
        getValuesFromLocalDB()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
                
        cell.imgContainer.image = images[indexPath.row]
        cell.lblImageTitle.text = imagesTitles[indexPath.row]
        cell.lblImageLocation.text = imagesLocations[indexPath.row]

        return cell
    }

    func uploadedImageDelegate(img: UIImage, imgLocation: String, imgTitle: String) {
        images.append(img)
        imagesLocations.append(imgLocation)
        imagesTitles.append(imgTitle)
        
        tblView.reloadData()
    }

    // Get Data from local DB
    func getValuesFromLocalDB() {
        
        let imgDatas = realm.objects(ImageCellData.self)
        
        images.removeAll()
        imagesLocations.removeAll()
        imagesTitles.removeAll()
        
        for imgData in imgDatas {
            let img = UIImage(data: imgData.image!)
            images.append(img!)
            imagesLocations.append(imgData.location)
            imagesTitles.append(imgData.title)
        }
        
        // Reload Table View
        tblView.reloadData()
    }
}
