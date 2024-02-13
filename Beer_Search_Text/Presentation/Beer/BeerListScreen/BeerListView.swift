//
//  BeerListView.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import SwiftUI
import SDWebImageSwiftUI

struct BeerListView: View {
    @StateObject var viewModel: BeerViewModel = BeerViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(viewModel.beerResponse) { beer in
                    NavigationLink(destination: BeerDetailView(beer: beer)) {
                        beerRow(beer: beer)
                    }
                }
                .navigationTitle("Beer List")
                .listStyle(PlainListStyle())
            }
            .onAppear {
                viewModel.getBeers()
            }
        }
    }
}


@ViewBuilder
func beerRow(beer: Beer) -> some View {
    HStack {
        WebImage(url: URL(string: beer.image_url))
            .resizable()
            .frame(width: 50, height: 100)
            .padding()
        Spacer()
        Text(beer.name)
        Spacer()
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
