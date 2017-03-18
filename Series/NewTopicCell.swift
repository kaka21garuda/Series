//
//  NewTopicCell.swift
//  Series
//
//  Created by Buka Cakrawala on 3/17/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class NewTopicCell: UICollectionViewCell {

    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var loveImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    //MARK: - Layout Subview
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // make the shadow effect
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5, height: 5)
        
        self.clipsToBounds = false
        
    }
}
