//
//  AddViewController.swift
//  Series
//
//  Created by Buka Cakrawala on 3/14/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import MobileCoreServices
import Firebase


class AddViewController: UIViewController {
    
    //MARK: - Firebase References
    //Database reference
    var databaseRef = FIRDatabase.database().reference()
    //Storage reference
    var storageRef = FIRStorage.storage().reference()
    
    
    // Example of content
    var currPost = ["Tittle", "why not there is the nnnd ksksks lalalalal kdkdkdkdk kadsjfakl;", "whhhhhhalalallala"] as [Any]
    
    @IBOutlet weak var addCollectionView: UICollectionView!
    
    @IBOutlet weak var publishButton: UIButton!
    
    @IBAction func publishAction(_ sender: UIButton) {
        
        
        
    }
    
    
    
    //MARK: - Outlets and Actions
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var uploadButton: UIButton!
//    @IBOutlet weak var progressView: UIProgressView!
//    @IBAction func uploadAction(_ sender: Any) {
//        
////        let imagePicker = UIImagePickerController()
////        imagePicker.sourceType = .photoLibrary
////        imagePicker.mediaTypes = [kUTTypeImage as String]
////        imagePicker.delegate = self
////        present(imagePicker, animated: true, completion: nil)
//
//        
//        makeObjectPost(title: "Third Post", imageTitle: #imageLiteral(resourceName: "william-iven-19844"), content: makeContentDict(contentPost: currPost), like: 4)
//    }
//    
//   
//    @IBAction func readAction(_ sender: UIButton) {
//        read()
//    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: - Write and Read
extension AddViewController {
    //MARK: - Dictionary Content
    func makeContentDict(contentPost: [Any]) -> [String: AnyObject] {
        
        var onePost = [String: AnyObject]()
        //Count will be the index of each content in order
        var count = 0
        
        for each in contentPost {
            count += 1
            if each is UIImage {
                //When each is type UIImage,
                //Convert each into Salada.File to be stored in FIRStorage
                //Make a key-value pair
                onePost["\(count)"] = returningImageData(image: each as! UIImage).name as AnyObject?
            } else if each is String {
                //When each is type String,
                //Make a key-value pair
                onePost["\(count)"] = each as AnyObject?
            }
        }
        //return a dictionary from a given array. So that can be indexed in the future.
        return onePost
    }
    
    //MARK: - Make Object
    func makeObjectPost(title: String, imageTitle: UIImage, content: [String: AnyObject], like: Int) {
        //Make a new post object
        let postObject = PostModel()
        postObject.title = title
        postObject.imageTitle = returningImageData(image: imageTitle)
        postObject.content = content
        postObject.like = String(like)
        //Save the new object to firebase
        postObject.save { (ref, error) in
            if error != nil {
                print(error?.localizedDescription)
            }

        }
        
    }
    
    //MARK: - Convert Image File
    //Extracting UIImage to convert it into Salada.File
    func returningImageData(image: UIImage) -> Salada.File {
        //Convert the UIImage into JPEG as NSData
        let data = UIImageJPEGRepresentation(image, 1)
        let file = Salada.File(data: data!)
        return file
    }
    
    func read() {
    
        databaseRef.child("v1/postmodel").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            
            let value = snapshot.value! as! [String : AnyObject]
            let content = value["content"]
            let title = value["title"]
            
            print(content![0])
            
        })
        
        
    }
    
    func readFIRDB() {
        
    }
}

//MARK: - Image Picker
extension AddViewController: UIImagePickerControllerDelegate {
    
    //Dismiss the collection view when user chooses cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType: String = info[UIImagePickerControllerMediaType] as? String else {
            dismiss(animated: true, completion: nil)
            return
        }
        //if mediatype is type image.
        if mediaType == (kUTTypeImage as String) {
            if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                let imagedata = UIImageJPEGRepresentation(originalImage, 0.8)
            }
        } else {
            // dismiss
            dismiss(animated: true, completion: nil)
            print("MOVIE IS NOT ALLWED")
            return
        }
        //dissmiss when everything is done
        dismiss(animated: true, completion: nil)
    }
}


