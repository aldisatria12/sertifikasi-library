//
//  CatalogueView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct CatalogueView: View {
    @StateObject var catalogueVM = CatalogueViewModel()
    @State var selectedCatalogue = 0
    @State var allCatalogue: [Catalogue] = []
    @State var sheetAddCatalogue = false
    @State var sheetEditCatalogue = false
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
                    ForEach(0..<allCatalogue.count) { i in
                        Button {
                            selectedCatalogue = i
                            sheetEditCatalogue.toggle()
                        } label: {
                            HStack {
                                Text(allCatalogue[i].catalogue_name ?? "missing")
                                Image(uiImage: allCatalogue[i].catalogue_image!)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                        }
                        .sheet(isPresented: $sheetEditCatalogue) {
                            EditCatalogueView(catalogue: allCatalogue[selectedCatalogue], sheetAvailable: $sheetEditCatalogue)
                        }

                    }
                    .id(catalogueVM.catalogues.count)
                }
                .listStyle(PlainListStyle())
            }
            .onChange(of: sheetAddCatalogue, perform: { newValue in
                catalogueVM.fetchCatalogues()
                allCatalogue = catalogueVM.catalogues
            })
            .onChange(of: sheetEditCatalogue) { newValue in
                catalogueVM.fetchCatalogues()
                allCatalogue = catalogueVM.catalogues
            }
            .onAppear {
                catalogueVM.fetchCatalogues()
                allCatalogue = catalogueVM.catalogues
            }
            
//        }
    }
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
