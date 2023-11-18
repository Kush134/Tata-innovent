//
//  SavedarCollectionViewCell.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 05/03/23.
//

import UIKit

class SavedarCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var savedImageView: UIImageView!
    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    func setup(with saved: Designs){
        savedImageView.image = UIImage(named: saved.imageName)
        titleLbl.text = saved.title
    }
}
