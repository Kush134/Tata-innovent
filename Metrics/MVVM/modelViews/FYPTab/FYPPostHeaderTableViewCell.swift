//
//  FYPPostHeaderTableViewCell.swift
//  Metrics
//
//  Created by Agrim Srivastava on 25/02/23.
//

import UIKit

class FYPPostHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var optionsButton: UIButton!
    
    var post: Post! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



    func updateUI() {
//        profileImageView.image = post.createdBy.profileImage
//        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
//        profileImageView.layer.masksToBounds = true
//
//        usernameButton.setTitle(post.createdBy.username, for: .normal)
//
//        optionsButton.layer.borderWidth = 1.0
//        optionsButton.layer.cornerRadius = 2.0
//        optionsButton.layer.masksToBounds = true
    }
}
