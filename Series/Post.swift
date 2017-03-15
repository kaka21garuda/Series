//
//  Post.swift
//  Series
//
//  Created by Buka Cakrawala on 3/15/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class Post {

    var title: TitleSlide
    var content: [Any]
    var upvote = 0
    
    init(title: TitleSlide, content: [Any]) {
        self.title = title
        self.content = content
    }
    

}
