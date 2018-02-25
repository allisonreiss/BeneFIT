//
//  CharityCell.swift
//  AthenaHacks
//
//  Created by Sarah Gemperle on 2/25/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit

class CharityCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var charity: NSDictionary?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
