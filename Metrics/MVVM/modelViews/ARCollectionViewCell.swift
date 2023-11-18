//
//  ARCollectionViewCell.swift
//  Metrics
//
//  Created by Agrim Srivastava on 10/04/23.
//

import UIKit

import UIKit

class ARCollectionViewCell: UICollectionViewCell {
    
  static let reuseIdentifier = String(describing: "ARCollectionViewCell".self)

  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!

  func update(with file: File) {
    nameLabel.text = file.name

    file.generateThumbnail { [weak self] image in
      DispatchQueue.main.async {
        self?.thumbnailImageView.image = image
      }
    }
  }
}
