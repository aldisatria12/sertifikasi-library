//
//  MemberCatalogueView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct MemberCatalogueView: View {
    @StateObject var catalogueVM = CatalogueViewModel()
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(catalogueVM.catalogues, id: \.self) { item in
                    CatalogueCardView(catalogue: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CatalogueCardView: View {
    var catalogue: Catalogue
    var body: some View {
        VStack{
            Image(uiImage: catalogue.catalogue_image!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 150 / 390, height: UIScreen.main.bounds.height * 150 / 844)
            Text(catalogue.catalogue_name ?? "Missing")
        }
    }
}
