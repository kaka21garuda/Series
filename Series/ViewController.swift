//
//  ViewController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

let title1 = TitleSlide(label: "Title 1", image: #imageLiteral(resourceName: "william-iven-19844"))
let title2 = TitleSlide(label: "Title 2", image: #imageLiteral(resourceName: "william-iven-19843"))
let title3 = TitleSlide(label: "Title 3", image: #imageLiteral(resourceName: "data_science01"))

class ViewController: UIViewController {

    @IBOutlet weak var topCollectionView: UICollectionView!
    
    
    let titles = [title1, title2, title3]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: -UPCaraouselFlowLayout
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width / 2) + 80, height: (view.bounds.height / 2) + 70)
        layout.scrollDirection = .horizontal
        topCollectionView.collectionViewLayout = layout
        

        // set both datasource & delegate to self
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        
    }

}

//MARK: - CollectionView Data Source
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! TopCollectionViewCell
        cell.title = titles[indexPath.item]
        return cell
    }


}

