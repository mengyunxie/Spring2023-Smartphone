//
//  TableViewCell.swift
//  CustomTableViewCellXib
//
//  Created by Miya on 2/14/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainer: UIImageView!
    
    @IBOutlet weak var lblImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
