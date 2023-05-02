//
//  UploadImageProtocol.swift
//  InstaWithUITest
//
//  Created by Miya on 4/21/23.
//

import Foundation
import UIKit

protocol UploadImageProtocol{
    
    func uploadedImageDelegate(img : UIImage, imgLocation: String, imgTitle: String)
    
}
