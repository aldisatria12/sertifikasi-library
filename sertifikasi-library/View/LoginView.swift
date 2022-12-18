//
//  LoginView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var userVM = UserViewModel()
    @State var username = ""
    var body: some View {
        NavigationView {
            VStack{
                HStack(spacing: 20) {
                    Text("username")
                    Spacer()
                    TextField("Input username", text: $username)
                        .frame(maxWidth: 200)
                }
                .padding(20)
                NavigationLink {
                    if userVM.login(username: username) == 1 {
                        TabBarAdminView()
                    } else if userVM.login(username: username) == 2 {
                        MemberCatalogueView()
                    }
                } label: {
                    Text("Login")
                }
            }
        }
    }
}
