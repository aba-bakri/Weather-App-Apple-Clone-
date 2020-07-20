//
//  HourlyCollectionViewCell.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/18/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var currentlyViewModel: CurrentlyViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView() {
        guard let currentlyViewModel = currentlyViewModel else { return }
        hourLabel.text = currentlyViewModel.timeAsHourText
        temperatureLabel.text = currentlyViewModel.temperatureText
        iconImageView.image = UIImage(named: currentlyViewModel.iconText)
    }

}
