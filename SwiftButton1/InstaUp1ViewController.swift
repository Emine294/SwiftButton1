//
//  InstaUp1ViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/05/24.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import Photos

class InstaUp1ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var saveImage:UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        PHPhotoLibrary.requestAuthorization{(status) in
            
            switch(status){
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if (segue.identifier == "next"){
            
            let subVC:FilterViewController = segue.destination as! FilterViewController
            
            subVC.passImage = saveImage
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if (info[.originalImage] as? UIImage) != nil
        {
            
            saveImage = info[.originalImage] as! UIImage
            
            
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
            
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
    
}
