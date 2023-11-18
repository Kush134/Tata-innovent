//
//  OnboardingViewController.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 01/03/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
        OnboardingSlide(title: "Take Live 3D Measurements & Submit", description: "We will help you through creating & capturing rooms", image: #imageLiteral(resourceName: "people-using-aumented-reality-smartphones_23-2148779102")),
        OnboardingSlide(title: "Take Live 3D Measurements & Submit", description: "We will help you through creating & capturing rooms", image: #imageLiteral(resourceName: "4738622")),
        OnboardingSlide(title: "Take Live 3D Measurements & Submit", description: "We will help you through creating & capturing rooms", image: #imageLiteral(resourceName: "4805873"))
        ]
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            if let controller = storyboard?.instantiateViewController(withIdentifier: "tabBarController") {
                controller.modalPresentationStyle = .overFullScreen
                present(controller, animated: true)
            }



        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }


    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row]) 
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
