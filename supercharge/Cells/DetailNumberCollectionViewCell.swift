//
//  DetailNumberCollectionViewCell.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit

class DetailNumberCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var rectangleLogo: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setNumberRepository(_ item : NumberRepository){
        self.titleLabel.text = item.name
        self.subtitleLabel.text = item.count
        if let icon_name = item.icon_name {
             self.iconImageView.image = UIImage.init(named: icon_name.rawValue)
            rectangleLogo.isHidden = true
        }else{
            self.iconImageView.image  = nil
              rectangleLogo.isHidden = false
        }
       
    }
}
