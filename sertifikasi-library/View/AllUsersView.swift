//
//  AllUsersView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct AllUsersView: View {
    @StateObject var userVM = UserViewModel()
    @State var sheetAddUsers = false
    var body: some View {
        VStack{
//            NavigationLink("Add User") {
//                TestingAddUserView()
//            }
            Button {
                sheetAddUsers.toggle()
            } label: {
                Text("Add User")
            }
            .sheet(isPresented: $sheetAddUsers) {
                TestingAddUserView(sheetAvailable: $sheetAddUsers)
            }
            List {
                ForEach(userVM.users) { user in
                    Text(user.username ?? "missing")
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct AllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersView()
    }
}
