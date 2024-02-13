//
//  BeerDetailView.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import SwiftUI
import SDWebImageSwiftUI

struct BeerDetailView: View {
    let beer: Beer
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: beer.image_url))
                .resizable()
                .frame(width: 150, height: 300)
                .padding()
            Text("\(beer.id)").font(.caption).foregroundColor(.yellow)
            Text(beer.name).font(.title)
            Text(beer.description).foregroundColor(.gray)
            Spacer()
        }.padding()
    }
}
