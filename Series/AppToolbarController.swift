//
//  AppToolbarController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/15/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import Material

class AppToolbarController: ToolbarController {

    override func prepare() {
        super.prepare()
        
        statusBarStyle = .default
        prepareToolbar()
        
    }
    
    func prepareToolbar() {
    
        toolbar.title = "Photo Library"
        toolbar.depthPreset = .none
        toolbar.dividerColor = Color.grey.lighten3
    
    }
    
}
