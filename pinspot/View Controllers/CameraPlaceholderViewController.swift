//
//  CameraPlaceholderViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/29/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class CameraPlaceholderViewController: UIViewController {

    var imagePickerViewController = UIImagePickerController()

    let preview = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Style.Color.white
    }

    override func viewWillAppear(_ animated: Bool) {

        // Make sure device has a camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // Setup and present default Camera View Controller
            self.imagePickerViewController.delegate = self
            self.imagePickerViewController.sourceType = .camera
            self.imagePickerViewController.allowsEditing = false
            self.tabBarController?.present(self.imagePickerViewController, animated: true, completion: {
                self.tabBarController?.selectedIndex = 0
            })
        } else {
            // Setup and present default Camera View Controller
            self.imagePickerViewController.delegate = self
            self.imagePickerViewController.sourceType = .photoLibrary
            self.imagePickerViewController.allowsEditing = false
            self.tabBarController?.present(self.imagePickerViewController, animated: true, completion: {
                self.tabBarController?.selectedIndex = 0
            })
        }
    }

}

extension CameraPlaceholderViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        self.imagePickerViewController.dismiss(animated: true, completion: nil)

        let image = info[.originalImage] as? UIImage

    }
}
