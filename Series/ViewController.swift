//
//  ViewController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

let title1 = TitleSlide(label: "Title 1", image: #imageLiteral(resourceName: "william-iven-19844"))
let title2 = TitleSlide(label: "Title 2", image: #imageLiteral(resourceName: "william-iven-19843"))
let title3 = TitleSlide(label: "Title 3", image: #imageLiteral(resourceName: "data_science01"))

class ViewController: UIViewController {

    @IBOutlet weak var topCollectionView: UICollectionView!
    
    
    let titles = [title1, title2, title3]
    
//    let cellScaling: CGFloat = 0.4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let screenSize = UIScreen.main.bounds.size
//        let cellWidth = floor(screenSize.width * cellScaling)
//        let cellHeight = floor(screenSize.height * cellScaling)
//        
//        let insetX = (view.bounds.width - cellWidth) / 2.0
//        let insetY = (view.bounds.height - cellHeight) / 2.0
//        
//        let layout = topCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//        topCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        
    }

}

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

