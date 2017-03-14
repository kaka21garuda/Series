//
//  TopCollectionViewCell.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class TopCollectionViewCell : UICollectionViewCell {

    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var title: TitleSlide? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI() {
    
        if let title = title {
            
            featuredImageView.image = title.image
            titleLabel.text = title.label
        } else {

            featuredImageView.image = nil
            titleLabel.text = nil
        }
    }
    
    //MARK: -Laoyout Subview
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // make the shadow effect
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5, height: 3)
        
        self.clipsToBounds = false
        
        
    }

}
