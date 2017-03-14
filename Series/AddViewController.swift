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

    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
    }

}
