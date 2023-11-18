//
//  OnboardingCollectionViewCell.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 01/03/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTitleLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
    }
    
}
