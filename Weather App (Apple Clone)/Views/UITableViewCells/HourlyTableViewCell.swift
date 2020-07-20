//
//  HourlyTableViewCell.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/18/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    var hourlyViewModel: HourlyViewModel? {
        didSet {
            updateView()
        }
    }
    var hourlyDataArray: [Currently] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hourlyCollectionView.register(UINib(nibName: "HourlyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HourlyCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        guard let hourlyViewModel = hourlyViewModel else { return }
        hourlyDataArray = hourlyViewModel.hourlyDataArray
        hourlyCollectionView.reloadData()
    }
    
}

extension HourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as! HourlyCollectionViewCell
        cell.currentlyViewModel = CurrentlyViewModel(currently: hourlyDataArray[indexPath.item])
        
        if indexPath.item == 0 {
            cell.hourLabel.font = .systemFont(ofSize: 15, weight: .semibold)
            cell.temperatureLabel.font = .systemFont(ofSize: 17, weight: .semibold)
            cell.hourLabel.text = "Сейчас"
        }
        return cell
    }
}
