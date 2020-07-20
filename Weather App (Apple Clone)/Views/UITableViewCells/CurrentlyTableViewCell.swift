//
//  CurrentlyTableViewCell.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/19/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class CurrentlyTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    var currentlyViewModel: CurrentlyViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        guard let currentlyViewModel = currentlyViewModel else { return }
        summaryLabel.text = currentlyViewModel.summaryText
        currentTemperatureLabel.text = currentlyViewModel.temperatureText
    }
    
}
