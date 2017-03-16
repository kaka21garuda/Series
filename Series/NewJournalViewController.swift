//
//  NewJournalViewController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import Firebase



class NewJournalViewController: UIViewController {
    
    var ref = FIRDatabase.database().reference()
    
    let post1 = Post(title: title1, content: [#imageLiteral(resourceName: "william-iven-19843"), "Title 1", #imageLiteral(resourceName: "data_science01")])
    let post2 = Post(title: title2, content: [#imageLiteral(resourceName: "data_science01"), "Title 2", #imageLiteral(resourceName: "william-iven-19844")])
    let post3 = Post(title: title3, content: [#imageLiteral(resourceName: "william-iven-19844"), "Title 3", #imageLiteral(resourceName: "data_science01")])
    
    var p = [#imageLiteral(resourceName: "william-iven-19843"), "Title 1", #imageLiteral(resourceName: "data_science01")] as [Any]
    
    
    @IBAction func writeAction(_ sender: UIButton) {
        let post0: [String: AnyObject] = [
            "title": title1 as AnyObject,
            "content": p as AnyObject
        ]
        write(post: post0)
    }
    
    @IBAction func readAction(_ sender: UIButton) {
        read()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func write(post: [String: AnyObject]) {
        ref.child("Posts").childByAutoId().setValue(post)
    }
    
    
    func read() {
        ref.child("Posts").observe(.value, with: { (Snapshot) in
            if Snapshot.exists() {
                if let postDict = Snapshot.value as? [String : AnyObject] {
                    for each in postDict as [String : AnyObject] {
                        let postID = each.0
                    }
                }
            }
        })
        
    }
    
    
}

