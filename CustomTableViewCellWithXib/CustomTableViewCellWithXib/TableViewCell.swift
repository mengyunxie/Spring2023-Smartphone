//
//  TableViewCell.swift
//  CustomTableViewCellWithXib
//
//  Created by Miya on 2/24/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgContainer: UIImageView!
    
    @IBOutlet weak var lblImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
