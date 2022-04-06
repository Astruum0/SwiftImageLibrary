//
//  ImagePicker.swift
//  SwiftImageLibrary
//
//  Created by Arthur VELLA on 06/04/2022.
//

import Foundation
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var show: Bool
    @Binding var image: Data
    var source : UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = context.coordinator
        return controller
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            self.parent.image = (info[.originalImage] as! UIImage).pngData()!
            self.parent.show.toggle()
        }
    }
    
}
