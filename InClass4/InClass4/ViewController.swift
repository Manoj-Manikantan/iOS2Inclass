//  ViewController.swift
//  InClass4
//  Created by Manoj on 2021-03-14.

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgPicture: UIImageView!
    let pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onGalleryClick(_ sender: UIButton) {
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func onCameraClick(_ sender: UIButton) {
        pickerController.sourceType = .camera
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if pickerController.sourceType == .photoLibrary {
            imgPicture?.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        else {
            imgPicture?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
