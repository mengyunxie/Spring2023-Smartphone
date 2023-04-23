//
//  TableViewCell.swift
//  FinalProject
//
//  Created by Miya on 4/22/23.
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
