//
//  InfoTableViewCell.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/20/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
