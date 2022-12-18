//
//  AdminLoanView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct AdminLoanView: View {
    @StateObject var catalogueVM = CatalogueViewModel()
    @State var sheetLoan = false
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(catalogueVM.catalogues, id: \.self) { item in
                    Button {
                        sheetLoan.toggle()
                    } label: {
                        CatalogueCardView(catalogue: item)
                    }
                    .sheet(isPresented: $sheetLoan) {
                        AddLoanView(sheetLoan: $sheetLoan, catalogue: item)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

