//
//  AddLoanView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct AddLoanView: View {
    @StateObject var loanVM = LoanViewModel()
    @State var pickedUser: User? = nil
    @State var sheetSelectUser = false
    @Binding var sheetLoan: Bool
    var catalogue: Catalogue
    var body: some View {
        VStack {
            Text("Loan \(catalogue.catalogue_name ?? "Missing Name") for 7 days")
            HStack {
                Text("Whose borrowing")
                Button {
                    sheetSelectUser.toggle()
                } label: {
                    ZStack{
                        Rectangle()
                            .cornerRadius(12)
                            .foregroundColor(Color.ui.grey0)
                        HStack {
                            Text(pickedUser == nil ? "Search..." : "\(pickedUser!.username!)")
                                .padding(.init(top: 0, leading: 6, bottom: 0, trailing: 0))
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 6))
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 150 / 390, height: UIScreen.main.bounds.height * 32 / 844)
                }
                .sheet(isPresented: $sheetSelectUser, content: {
                    SearchUserView(pickedItem: $pickedUser, sheetSelectUser: $sheetSelectUser)
                })
            }
            Button {
                guard let pickedUser = pickedUser else { return }
                loanVM.addLoan(user: pickedUser, catalogue: catalogue)
                sheetLoan.toggle()
            } label: {
                Text("Submit")
            }

        }
    }
    
    
}


//struct AddLoanView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddLoanView()
//    }
//}
