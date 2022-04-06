//
//  ListPhotoViewModel.swift
//  SwiftImageLibrary
//
//  Created by Arthur VELLA on 06/04/2022.
//

import Foundation

class ListPhotoViewModel: ObservableObject {
    @Published var currentImage : Data = .init(capacity: 0)
    @Published var showImagePicker = false
}
