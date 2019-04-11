//
//  DetailTitleCollectionViewCell.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit

class DetailTitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customUI()
    }
    //MARK: UI
    private func customUI(){
        self.avatarImageView.layer.cornerRadius =  self.avatarImageView.frame.width / 2
        self.avatarImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.avatarImageView.layer.masksToBounds = true
    }
    
    //MARK: Public
    /**
     Populat UI
     */
    func setInterface(_ interface : RepositoryInterface){
        self.titleLabel.text = interface.title
        self.subtitleLabel.text = interface.sub_title
        if let avatar_url = interface.avatar_owner_url {
            self.avatarImageView.kf.setImage(with: avatar_url)
        }
        else{
            self.avatarImageView = nil
        }
        
    }

}
