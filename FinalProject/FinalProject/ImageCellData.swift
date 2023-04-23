//
//  ImageCellData.swift
//  FinalProject
//
//  Created by Miya on 4/22/23.
//

import Foundation
import RealmSwift

class ImageCellData: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var image: Data?
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
