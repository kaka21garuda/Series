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
    
    var newArr = [String]()
    
    var databaseRef = FIRDatabase.database().reference()
    var storageRef = FIRStorage.storage().reference()
    
    var point = 0
    
    
    
    var currPost = ["Tittle", #imageLiteral(resourceName: "data_science01"),"why not there is the nnnd ksksks lalalalal kdkdkdkdk kadsjfakl;", "whhhhhhalalallala"] as [Any]
    
    
    
    
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func uploadAction(_ sender: Any) {
        
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.mediaTypes = [kUTTypeImage as String]
//        imagePicker.delegate = self
//        present(imagePicker, animated: true, completion: nil)

         // objectDB()
        //makeContentDict()
        
        makeObjectPost(title: "Third Post", imageTitle: #imageLiteral(resourceName: "william-iven-19844"), content: makeContentDict(contentPost: currPost))
        
    }
    
    func makeContentDict(contentPost: [Any]) -> [String: AnyObject] {
        
        var onePost = [String: AnyObject]()
        var count = 0
        
        for each in contentPost {
            count += 1
            if each is UIImage {
                onePost["\(count)"] = returningImageData(image: each as! UIImage).name as AnyObject?
            } else if each is String {
                onePost["\(count)"] = each as AnyObject?
            }
        }
        
        return onePost
        
    }
    
    func makeObjectPost(title: String, imageTitle: UIImage, content: [String: AnyObject]) {
        let postObject = PostModel()
        postObject.title = title
        postObject.imageTitle = returningImageData(image: imageTitle)
        postObject.content = content
        postObject.save { (ref, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
        
        openURL()
        print(postObject.imageTitle?.name)
        
    }
    
    func openURL() {
        let imageURL = storageRef.child("1489698765552")
        imageURL.downloadURL { (url, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("\n\n\nURL: \(url!)")
            }
        }
    }
    
    func objectDB() {
        
        let anotherPost = PostModel()
        anotherPost.title = "Second Post!"
        anotherPost.content = ["1": "Four" as AnyObject, "2": "Six" as AnyObject, "3": "Nine" as AnyObject]
//        anotherPost.imageTitle = returningImageData(image: #imageLiteral(resourceName: "data_science01"))
//        anotherPost.save { (ref, error) in
//            if error != nil {
//                print(error?.localizedDescription)
//            }
//        }
        
        
    }
    
    func returningImageData(image: UIImage) -> Salada.File {
        let data = UIImageJPEGRepresentation(image, 1)
        let file = Salada.File(data: data!)
        return file
    }
    
    func uploadImage(image: UIImage, object: PostModel) {
        
        let data: Data = UIImageJPEGRepresentation(image, 1)!
        let file: Salada.File = Salada.File(data: data)
        object.imageTitle = file
        
        let task: FIRStorageUploadTask = object.imageTitle!.save { (metadata, error) in
            if let error = error {
                print(error)
                return
            }
            }!
        
        
    }
    
    
    func addingChildDatabaseExperiement() {
        
        
        
        for post in currPost {
            if post is UIImage {
                let imageData = UIImageJPEGRepresentation(post as! UIImage, 0.8)
                returningImageMetadataString(data: imageData! as NSData)
            }
        }
        
        
    }
    
    func returningImageMetadataString(data: NSData) {
        
        var urlString = ""
        
        
        let imageName = NSUUID().uuidString
        let storageRef = FIRStorage.storage().reference(withPath: "images/\(imageName).jpg")
        let uploadMetadata = FIRStorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        let uploadTask = storageRef.put(data as Data, metadata: uploadMetadata) { (metadata, error) in
            if error != nil {
                print("I received error! \(error?.localizedDescription)")
            } else {
                urlString = String(describing: metadata?.downloadURL()!)
                self.newArr.append(urlString)
            }
        }
    }
    
    func storeImageDB(string: String) {
        let key  = databaseRef.child("Posts").childByAutoId().key
        
        point += 1
        
        let dictionaryPost = ["\(point)": string]
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType: String = info[UIImagePickerControllerMediaType] as? String else {
            dismiss(animated: true, completion: nil)
            return
        }
        if mediaType == (kUTTypeImage as String) {
            if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                let imagedata = UIImageJPEGRepresentation(originalImage, 0.8)
                //uploadImageToFirebaseStorage(data: imagedata! as NSData)
                
            }
            
        } else {
            
            dismiss(animated: true, completion: nil)
            print("MOVIE IS NOT ALLWED")
            return
            
        }
        dismiss(animated: true, completion: nil)
    }
}
