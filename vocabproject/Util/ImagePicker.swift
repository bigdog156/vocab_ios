//
//  ImagePicker.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
        
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        print("Update Image Controller")
    }
    func makeCoordinator() -> CoordinatorCustom {
        CoordinatorCustom(self)
    }
}
class CoordinatorCustom: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
