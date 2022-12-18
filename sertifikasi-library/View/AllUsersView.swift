//
//  AllUsersView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct AllUsersView: View {
    @StateObject var userVM = UserViewModel()
    @State var allUser: [User] = []
    @State var sheetAddUsers = false
    @State var sheetEditUsers = false
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
                ForEach(allUser) { user in
                    Button {
                        sheetEditUsers.toggle()
                    } label: {
                        Text(user.username ?? "missing")
                    }
                    .sheet(isPresented: $sheetEditUsers) {
                        EditUserView(user: user, sheetAvailable: $sheetEditUsers)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .onChange(of: sheetEditUsers, perform: { newValue in
            userVM.fetchUsers()
            allUser = userVM.users
        })
        .onChange(of: sheetAddUsers) { newValue in
            userVM.fetchUsers()
            allUser = userVM.users
        }
        .onAppear {
            userVM.fetchUsers()
            allUser = userVM.users
        }
    }
}

struct AllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersView()
    }
}
