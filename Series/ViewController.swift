//
//  ViewController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout
import Material


let title1 = TitleSlide(label: "Title 1", image: #imageLiteral(resourceName: "william-iven-19844"))
let title2 = TitleSlide(label: "Title 2", image: #imageLiteral(resourceName: "william-iven-19843"))
let title3 = TitleSlide(label: "Title 3", image: #imageLiteral(resourceName: "data_science01"))



class ViewController: UIViewController {

    @IBOutlet weak var topCollectionView: UICollectionView!
    
    @IBOutlet weak var newCollectionView: UICollectionView!
    
    
    
    
    let titles = [title1, title2, title3]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: -UPCaraouselFlowLayout
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width / 2) + 80, height: (view.bounds.height / 2) - 40)
        layout.scrollDirection = .horizontal
        topCollectionView.collectionViewLayout = layout
        topCollectionView.showsHorizontalScrollIndicator = false
        
        

        // Set Datasource to self
        topCollectionView.dataSource = self
        newCollectionView.dataSource = self
        
        // Set Delegate to self
        newCollectionView.delegate = self
        topCollectionView.delegate = self
        
        
        
    }
}

//MARK: - CollectionView Data Source
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollectionView {
            return titles.count
        } else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == topCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! TopCollectionViewCell
            cell.title = titles[indexPath.item]
            cell.loveImage.image = #imageLiteral(resourceName: "heart")
            cell.likeCountLabel.text = "300"
            return cell
        } else {
            let newTopicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "newTopicCell", for: indexPath) as! NewTopicCell
            newTopicCell.loveImage.image = #imageLiteral(resourceName: "heart")
            newTopicCell.titleLabel.text = "label"
            return newTopicCell
        }
        
    }
    
    //MARK: - Cell Sizing and Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Set the size of each cell
        
        if collectionView == newCollectionView {
            return CGSize(width: (view.frame.width / 2) - 20, height: (view.frame.height / 8) + 52)
        } else {
            return CGSize(width: (view.bounds.width / 2) + 80, height: (view.bounds.height / 2) - 40)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //Set the spacing between each cell
        
        if collectionView == newCollectionView {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        } else {
            return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 20)
        }
        
        
        
    }
}
