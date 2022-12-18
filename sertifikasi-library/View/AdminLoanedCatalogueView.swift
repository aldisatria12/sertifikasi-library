//
//  AdminLoanedCatalogueView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct AdminLoanedCatalogueView: View {
    @StateObject var loanVM = LoanViewModel()
    @State var loanStill: [Loan] = []
    @State var sheetOn = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                ForEach(loanStill, id: \.self) { loan in
                    Button {
                        sheetOn.toggle()
                    } label: {
                        LoanedCatalogueCardView(loan: loan)
                    }
                    .sheet(isPresented: $sheetOn) {
                        ReturnCatalogueView(loan: loan, sheetOn: $sheetOn)
                    }
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            refreshLoan()
        }
        .onChange(of: sheetOn) { newValue in
            refreshLoan()
        }
    }
    
    func refreshLoan() {
        loanStill = loanVM.loanedCatalogue.filter({ $0.is_returned == false })
    }
}

struct LoanedCatalogueCardView: View {
    var loan: Loan
    var body: some View {
        HStack{
            Image(uiImage: loan.catalogue!.catalogue_image!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 100 / 390, height: UIScreen.main.bounds.height * 100 / 844)
            Text(loan.catalogue?.catalogue_name ?? "Missing")
        }
    }
}

struct ReturnCatalogueView: View {
    @StateObject var loanVM = LoanViewModel()
    var loan: Loan
    @Binding var sheetOn: Bool
    var body: some View {
        VStack {
            Image(uiImage: loan.catalogue!.catalogue_image!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 150 / 390, height: UIScreen.main.bounds.height * 150 / 844)
            Text(loan.catalogue?.catalogue_name ?? "Missing")
            Button {
                loanVM.returnLoan(data: loan)
                sheetOn.toggle()
            } label: {
                Text("Return")
            }

        }
    }
}


