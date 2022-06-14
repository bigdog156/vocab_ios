//
//  CameraPicker.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import UIKit
import SwiftUI

struct CameraPicker: UIViewControllerRepresentable{
    
    @Binding var image: UIImage?
//    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let cameraPicker = UIImagePickerController()
        cameraPicker.allowsEditing = false
        cameraPicker.sourceType = .camera
        cameraPicker.delegate = context.coordinator
        return cameraPicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
        print("Update Camera")
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Call Camera Picker")
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.parent.image = selectedImage
        picker.dismiss(animated: true)
    }
}
