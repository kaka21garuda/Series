//
//  AddViewController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddViewController: UIViewController {

    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var writeButton: UIButton!
    
    @IBAction func pictureAction(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func writeAction(_ sender: UIButton) {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pictureButton.layer.cornerRadius = pictureButton.bounds.height / 2
        pictureButton.setBackgroundImage(#imageLiteral(resourceName: "photo-camera"), for: .normal)
        writeButton.setBackgroundImage(#imageLiteral(resourceName: "edit-3"), for: .normal)
        
        
    }
    
    
}
