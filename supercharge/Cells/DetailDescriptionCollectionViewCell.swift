//
//  DetailDescriptionCollectionViewCell.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit

class DetailDescriptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInterface(_ interface : RepositoryInterface){
        self.descriptionLabel.text = interface.detailText
        
        
    }

}
