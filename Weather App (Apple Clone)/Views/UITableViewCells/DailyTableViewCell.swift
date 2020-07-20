//
//  DailyTableViewCell.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/18/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var dailyDatumViewModel: DailyDatumViewModel? {
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
        guard let dailyDatumViewModel = dailyDatumViewModel else { return }
        dayLabel.text = dailyDatumViewModel.timeAsDayText
        iconImageView.image = UIImage(named: dailyDatumViewModel.iconText)
        lowTemperatureLabel.text = dailyDatumViewModel.temperatureLowText
        highTemperatureLabel.text = dailyDatumViewModel.temperatureHighText
    }
    
}
