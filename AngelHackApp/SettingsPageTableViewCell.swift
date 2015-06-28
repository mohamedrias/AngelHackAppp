//
//  SettingsPageTableViewCell.swift
//  
//
//  Created by Alvin Varghese on 27/Jun/15.
//
//

import UIKit

class SettingsPageTableViewCell: UITableViewCell {
    
    
    //MARK: Outlets

    @IBOutlet var childPhoto: UIImageView!
    @IBOutlet var childDOB: UILabel!
    @IBOutlet var childName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
