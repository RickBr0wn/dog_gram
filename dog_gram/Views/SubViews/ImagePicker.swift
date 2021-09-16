//
//  ImagePicker.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
  @Environment(\.presentationMode) var presentationMode
  @Binding var imageSelected: UIImage
  @Binding var sourceType: UIImagePickerController.SourceType
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIImagePickerController {
    let _imagePickerController = UIImagePickerController()
    _imagePickerController.delegate = context.coordinator
    _imagePickerController.sourceType = sourceType
    _imagePickerController.allowsEditing = true
    return _imagePickerController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {}
  
  func makeCoordinator() -> ImagePickerCoordinator {
    return ImagePickerCoordinator(parent: self)
  }
  
  class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker
    
    init(parent: ImagePicker) {
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
        parent.imageSelected = image
        parent.presentationMode.wrappedValue.dismiss()
      }
    }
  }
}
