//
//  RepositoryTableViewCell.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var idTextLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
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
        self.containerView.layer.cornerRadius = 8
        self.containerView.layer.masksToBounds = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Public
    /**
     Populat UI
    */
    func setInterface(_ interface : RepositoryInterface){
        self.titleLabel.text = interface.title
        self.subtitleLabel.text = interface.sub_title
        self.idTextLabel.text = interface.id_text
        if let avatar_url = interface.avatar_owner_url {
            self.avatarImageView.kf.setImage(with: avatar_url)
        }
        else{
             self.avatarImageView = nil
        }
        
    }
}
