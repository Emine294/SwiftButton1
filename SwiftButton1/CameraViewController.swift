//
//  CameraViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/05/25.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import Photos

class CameraViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet var backImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        PHPhotoLibrary.requestAuthorization{(status) -> Void in
        
            switch(status){
            case .authorized: print("Authorized")
            case .denied: print("Denied")
            case .notDetermined: print("NotDetermined")
            case .restricted: print("Restricted ")
            }
        }

    }
    
    @IBAction func openCamera(_ sender: Any) {
        
        let souceType:UIImagePickerController.SourceType =
        UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = souceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage
        {
            backImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let souceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = souceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func share(_ sender: Any) {
        
        let text = ""
        let url = NSURL(string: "http://www.apple.com")
        
//        let items = [text, url ,backImageView.image] as [Any]
//        
//        let activityVC = UIActivityViewController(activityItems:items, applicationActivities: nil)
//        self.present(activityVC, animated: true, completion: nil)
//        
        
    }
}
