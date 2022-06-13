//
//  CameraPicker.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import UIKit
import SwiftUI

struct CameraPicker: UIViewControllerRepresentable{
    
    @Binding var image: UIImage
//    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let cameraPicker = UIImagePickerController()
        cameraPicker.allowsEditing = false
        cameraPicker.sourceType = .camera
        
    }
    func makeCoordinator() -> CoordinatorCamera {
        CoordinatorCamera(self)
    }
}

class CoordinatorCamera: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var parent: CameraPicker
    
    init(_ parent: CameraPicker){
        self.parent = parent
    }
    
    func picker(_ picker: UIImagePickerController, didFinishPicking result: [UIImagePickerController.InfoKey: Any]){
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            parent.image = image
        }
        picker.dismiss(animated: true)
    }
}
