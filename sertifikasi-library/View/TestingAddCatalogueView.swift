//
//  TestingAddCatalogueView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI
import PhotosUI

struct TestingAddCatalogueView: View {
    @StateObject var catalogueVM = CatalogueViewModel()
    @State var catalogue_name = ""
    @State var pickerImage: [PhotosPickerItem] = []
    @State var data: Data?
    @Binding var sheetAvailable: Bool
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                if let data = data, let uiimage = UIImage(data: data) {
                    Image(uiImage: uiimage)
                        .resizable()
                }
                PhotosPicker(selection: $pickerImage, maxSelectionCount: 1 , matching: .any(of: [.images])) {
                    Text("Select Image")
                        .padding(10)
                        .background(Color(.blue))
                }
                .onChange(of: pickerImage) { newValue in
                    guard let item = pickerImage.first else { return }
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print("Data empty")
                            }
                        case .failure(let failure):
                            fatalError("\(failure)")
                        }
                    }
                }
            }
            .padding(.top)
            HStack(spacing: 20) {
                Text("book name")
                Spacer()
                TextField("Input book name", text: $catalogue_name)
                    .frame(maxWidth: 200)
            }
            .padding(20)
            Button("Submit") {
                if let data = data {
                    guard let catalogue_image = UIImage(data: data) else { return }
                    catalogueVM.addCatalogue(name: catalogue_name, image: catalogue_image)
                    sheetAvailable.toggle()
                }
            }
            Spacer()
        }
    }
}

//struct TestingAddCatalogueView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestingAddCatalogueView()
//    }
//}
