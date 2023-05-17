//
//  ImagePickerView.swift
//  CameraUI
//
//  Created by 서정덕 on 2023/05/17.
//

import SwiftUI
import UIKit

// A struct that confirms to UIViewControllerRepresentable to wrap UIImagePickerController
struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    // Create the UIImagePickerController and set the source type
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // Set the coordinator as the delegate
        return imagePicker
    }

    // Update the view controller if needed
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No updates needed for this example
    }

    // Connect the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }

    // Coordinator class for handling UIImagePickerControllerDelegate methods
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: ImagePickerView
        
        init(picker: ImagePickerView) {
            self.picker = picker
        }
        
        // Called when the user finishes picking media with info
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.picker.selectedImage = selectedImage
            self.picker.isPresented.wrappedValue.dismiss()
        }
    }
}
