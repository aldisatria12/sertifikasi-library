//
//  SearchUserView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import Foundation
import SwiftUI

struct SearchUserView: View {
    @StateObject var userVM = UserViewModel()
    @Binding var pickedItem: User?
    @State var filteredUser: [User] = []
    @State var searchText = ""
    @Binding var sheetSelectUser: Bool
    var body: some View {
        VStack{
            SearchBar(text: $searchText, placeholder: "Search user")
            ForEach(filteredUser, id: \.self) { user in
                Button {
                    pickedItem = user
                    sheetSelectUser.toggle()
                } label: {
                    Text("\(user.username!)").tag("\(user.username!)")
                }
            }
        }
        .onChange(of: searchText) { newValue in
            filteredUser = filterUser(searchText: searchText)
        }
        .onAppear {
            filteredUser = filterUser(searchText: searchText)
        }
    }
    
    func filterUser(searchText: String) -> [User] {
        return userVM.users.filter {
            searchText.isEmpty ? true : $0.username!.lowercased().contains(searchText.lowercased())
        }
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator

        searchBar.placeholder = placeholder
        searchBar.autocapitalizationType = .none
        searchBar.searchBarStyle = .minimal
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
