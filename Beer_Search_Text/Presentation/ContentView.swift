//
//  ContentView.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BeerListView()
                .tabItem {
                    Label("Beer List", systemImage: "list.dash")
                }
            
            BeerSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            BeerRandomView()
                .tabItem {
                    Label("Random Beer", systemImage: "shuffle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
