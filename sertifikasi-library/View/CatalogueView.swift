//
//  CatalogueView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct CatalogueView: View {
    @StateObject var catalogueVM = CatalogueViewModel()
    @State var sheetAddCatalogue = false
    var body: some View {
//        NavigationView {
            VStack{
//                NavigationLink("Add Catalogue") {
//                    TestingAddCatalogueView()
//                }
                Button {
                    sheetAddCatalogue.toggle()
                } label: {
                    Text("Add Catalogue")
                }
                .sheet(isPresented: $sheetAddCatalogue) {
                    TestingAddCatalogueView(sheetAvailable: $sheetAddCatalogue)
                }

                List {
                    ForEach(catalogueVM.catalogues) { catalogue in
                        HStack {
                            Text(catalogue.catalogue_name ?? "missing")
                            Image(uiImage: catalogue.catalogue_image!)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    .id(catalogueVM.catalogues.count)
                }
                .listStyle(PlainListStyle())
            }
            
//        }
    }
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
