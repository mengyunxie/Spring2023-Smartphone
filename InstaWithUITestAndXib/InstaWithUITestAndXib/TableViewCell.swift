//
//  TableViewCell.swift
//  InstaWithUITestAndXib
//
//  Created by Miya on 4/21/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgContainer: UIImageView!
    
    @IBOutlet weak var lblImageTitle: UILabel!
    
    @IBOutlet weak var lblImageLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
