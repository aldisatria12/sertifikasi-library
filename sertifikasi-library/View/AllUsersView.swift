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
    @State var selectedUser = 0
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
//            List {
            VStack {
                ForEach(0..<allUser.count, id: \.self) { i in
                    Button {
                        selectedUser = i
                        sheetEditUsers.toggle()
                    } label: {
                        Text(allUser[i].username ?? "missing")
                    }
                    .sheet(isPresented: $sheetEditUsers) {
                        EditUserView(user: selectedUser, sheetAvailable: $sheetEditUsers)
                    }
                }                
            }
//            }
            
            .onAppear {
                userVM.fetchUsers()
                allUser = userVM.users
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
    }
}

struct AllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersView()
    }
}
