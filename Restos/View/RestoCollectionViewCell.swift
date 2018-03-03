//
//  RestoCollectionViewCell.swift
//  Restos
//
//  Created by Nina Yousefi on 3/1/18.
//  Copyright © 2018 Nina Yousefi. All rights reserved.
//

import UIKit
import AlamofireImage

class RestoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setContentWith(resto: DTOBranch) {
        
        distanceLabel.layer.masksToBounds = true
        distanceLabel.layer.cornerRadius = 10
        
        if let title = resto.nameFa {
            titleLabel.text = title
        }
        
        if let distance = resto.distance {
            let km = distance / 1000
            let kmStr = String(format:"%.0f", km)
            distanceLabel.text = "\(kmStr) KM"
        }

        if let imageUrl = URL(string: (resto.logoUrl)!) {
            imageView.af_setImage(withURL: imageUrl, placeholderImage: UIImage(named: "three_dots" ))
        }


    }
}
