//
//  TableViewCell.swift
//  MVVM
//
//  Created by Raghavendra on 08/06/19.
//  Copyright © 2019 Raghavendra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewDisplay: UIImageView!
    
    
    @IBOutlet weak var artistNameDipslay: UILabel!
    
    @IBOutlet weak var trackNameDisplay: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
