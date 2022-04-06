//
//  ListPhotoView.swift
//  SwiftImageLibrary
//
//  Created by Arthur VELLA on 06/04/2022.
//

import SwiftUI

struct ListPhotoView: View {
    @ObservedObject var listPhotoVM = ListPhotoViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                
                List {
                    if listPhotoVM.currentImage.count != 0 {
                        HStack {
                        Image(uiImage: UIImage(data: listPhotoVM.currentImage)!).resizable().scaledToFit().frame(width: 100, height: 150).rotationEffect(.degrees(90))
                            Text("Last Photo")
                        }
                    } else {
                        Button {
                            listPhotoVM.showImagePicker.toggle()
                        } label: {
                            Text("No photo stored, press here to take a picture").foregroundColor(.blue)
                        }


                    }
                }
                .navigationTitle("All photos")
                .navigationBarItems(trailing: Button(action: {
                    listPhotoVM.showImagePicker.toggle()
                }, label: {
                    Image(systemName: "camera")
                }))
            }
            if listPhotoVM.showImagePicker {
                ImagePicker(show: $listPhotoVM.showImagePicker, image: $listPhotoVM.currentImage, source: .camera)
            }
            
        }
    }
}

struct ListPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ListPhotoView()
    }
}
