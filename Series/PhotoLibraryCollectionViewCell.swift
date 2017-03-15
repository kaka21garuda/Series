//
//  PhotoLibraryCollectionViewCell.swift
//  Series
//
//  Created by Buka Cakrawala on 3/15/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import Material

class PhotoLibraryCollectionViewCell: CollectionViewCell {
    
    override func prepare() {
        super.prepare()
        pulseColor = .white
        pulseAnimation = .backing
        contentsGravityPreset = .resizeAspectFill
    }

}
