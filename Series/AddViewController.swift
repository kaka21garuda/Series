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
    
    var point = 0
    
    
    
    var currPost = [#imageLiteral(resourceName: "data_science01"), "Tittle", "why not there is the nnnd ksksks lalalalal kdkdkdkdk kadsjfakl;", #imageLiteral(resourceName: "william-iven-19844"), #imageLiteral(resourceName: "william-iven-19843"), "whhhhhhalalallala"] as [Any]
    
    
    
    
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func uploadAction(_ sender: Any) {
        
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.mediaTypes = [kUTTypeImage as String]
//        imagePicker.delegate = self
//        present(imagePicker, animated: true, completion: nil)

        objectDB()
        
    }
    
    func objectDB() {
        
        let anotherPost = PostModel()
        anotherPost.title = "First Post!"
        anotherPost.content = ["One", "Two", "Three"]
        anotherPost.imageTitle = returningImageData(image: #imageLiteral(resourceName: "data_science01"))
        anotherPost.save { (ref, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
        
        
        
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
