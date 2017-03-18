//
//  AddingControllerExtension.swift
//  Series
//
//  Created by Buka Cakrawala on 3/18/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

extension AddViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let addingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: <#T##IndexPath#>)
    }
    

}
