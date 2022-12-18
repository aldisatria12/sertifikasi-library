//
//  EditUserView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct EditUserView: View {
    var user: User
    @State var username: String = ""
    @State var address: String = ""
    @State var phone: String = ""
    @State var isAdmin: Bool = true
    @StateObject var userVM = UserViewModel()
    @Binding var sheetAvailable: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("username")
                Spacer()
                TextField("Input username", text: $username)
                    .frame(maxWidth: 200)
            }
            .padding(20)
            HStack(spacing: 20) {
                Text("address")
                Spacer()
                TextField("Input address", text: $address)
                    .frame(maxWidth: 200)
            }
            .padding(20)
            HStack(spacing: 20) {
                Text("phone")
                Spacer()
                TextField("Input phone", text: $phone)
                    .frame(maxWidth: 200)
            }
            .padding(20)
            HStack(spacing: 20) {
                Toggle("is admin?", isOn: $isAdmin)
            }
            .padding(20)
            HStack {
                Button("Delete") {
                    userVM.deleteUser(data: user)
                    sheetAvailable.toggle()
                }
                .padding(20)
                Button("Submit") {
                    userVM.editUser(data: user, name: username, address: address, is_admin: isAdmin, phone: phone)
                    sheetAvailable.toggle()
                }
                .padding(20)
            }
            Spacer()
        }
        .onAppear {
            username = user.username!
            address = user.address!
            phone = user.phone!
            isAdmin = user.is_admin
        }
    }
}

