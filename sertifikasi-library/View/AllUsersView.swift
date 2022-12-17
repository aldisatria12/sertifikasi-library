//
//  AllUsersView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct AllUsersView: View {
    @StateObject var userVM = UserViewModel()
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink("Add User") {
                    TestingAddUserView()
                }
                List {
                    ForEach(userVM.users) { user in
                        Text(user.username ?? "missing")
                    }
                }
                .listStyle(PlainListStyle())                
            }
        }
        .navigationTitle("Available Users")
    }
}

struct AllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersView()
    }
}
