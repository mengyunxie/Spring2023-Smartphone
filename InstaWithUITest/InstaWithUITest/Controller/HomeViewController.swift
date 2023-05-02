//
//  HomeViewController.swift
//  InstaWithUITest
//
//  Created by Miya on 4/21/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    
    var images : [UIImage] = [UIImage]()
    var imagesLocations = [String]()
    var imagesTitles : [String] = [String]()
    

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgContainer.image = images[indexPath.row]
        cell.lblImageTitle.text = imagesTitles[indexPath.row]
        cell.lblImageLocation.text = imagesLocations[indexPath.row]

        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 350
//    }
    
    func uploadedImageDelegate(img: UIImage, imgLocation: String, imgTitle: String) {
        images.append(img)
        imagesLocations.append(imgLocation)
        imagesTitles.append(imgTitle)
        
        tblView.reloadData()
    }
}
