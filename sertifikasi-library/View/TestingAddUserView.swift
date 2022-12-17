//
//  TestingAddUserView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct TestingAddUserView: View {
    @State var username: String = ""
    @State var address: String = ""
    @State var phone: String = ""
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
            Button("Submit") {
                userVM.addUser(name: username, address: address, is_admin: true, phone: phone)
                sheetAvailable.toggle()
            }
            Spacer()
        }
    }
}

//struct TestingAddUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestingAddUserView()
//    }
//}
