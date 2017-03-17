//
//  PostSalada.swift
//  Series
//
//  Created by Buka Cakrawala on 3/16/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import Foundation

class PostModel: Salada.Object {
    
    typealias Element = PostModel
    
    dynamic var title: String?
    dynamic var imageTitle: Salada.File?
    dynamic var content: [String: AnyObject]?
    dynamic var like: String?
    

}
