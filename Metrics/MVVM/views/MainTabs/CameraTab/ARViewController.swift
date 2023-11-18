//
//  ARViewController.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 28/03/23.
//

import UIKit

class ARViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var modelList = ["3d01","3d02","3d03","3d04","3d05"]
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }
    

    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int)
    -> Int {
        return modelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.myImage.image = UIImage(named: modelList[indexPath.row])
        cell.myImage.layer.cornerRadius = cell.frame.height/2
        return cell
        
    }

}

