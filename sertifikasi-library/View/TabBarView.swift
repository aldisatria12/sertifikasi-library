//
//  TabBarView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        NavigationView {
            TabView {
                AllUsersView()
                    .tabItem {
                                Label("Users", systemImage: "person.fill")
                            }
                CatalogueView()
                    .tabItem {
                                Label("Catalogue", systemImage: "book.fill")
                            }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
