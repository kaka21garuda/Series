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

    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func uploadAction(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func uploadImageToFirebaseStorage(data: NSData) {
        let storageRef = FIRStorage.storage().reference().child("images/demoPic.jpg")
        let uploadMetadata = FIRStorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        let uploadTask = storageRef.put(data as Data, metadata: uploadMetadata) { (metadata, error) in
            if error != nil {
                print("I received error! \(error?.localizedDescription)")
            } else {
                print("upload complete, here's some metadata. \(metadata)")
                print("Metadata url \(metadata?.downloadURL())")
            }
        }
        
        //Update the progress bar
        uploadTask.observe(.progress) { [weak self] (snapshot) in
            guard let stongself = self else {return}
            guard let progress = snapshot.progress else {return}
            stongself.progressView.progress = Float(progress.fractionCompleted)
        }
        
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
                uploadImageToFirebaseStorage(data: imagedata! as NSData)
                
            }
            
        } else {
        
            dismiss(animated: true, completion: nil)
            print("MOVIE IS NOT ALLWED")
            return
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    

}
