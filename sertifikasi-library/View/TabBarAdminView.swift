//
//  TabBarAdminView.swift
//  sertifikasi-library
//
//  Created by Aldi Mahotma on 18/12/22.
//

import SwiftUI

struct TabBarAdminView: View {
    var body: some View {
        TabView {
            AllUsersView()
                .tabItem {
                    Label("Users", systemImage: "person.fill")
                }
            CatalogueView()
                .tabItem {
                    Label("Catalogue", systemImage: "books.vertical")
                }
            AdminLoanView()
                .tabItem {
                    Label("Loan Item", systemImage: "book.fill")
                }
            AdminLoanedCatalogueView()
                .tabItem {
                    Label("Loaned List", systemImage: "book.closed.fill")
                }
        }
    }
}

struct TabBarAdminView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarAdminView()
    }
}
