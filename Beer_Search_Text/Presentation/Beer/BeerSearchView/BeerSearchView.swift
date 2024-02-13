//
//  BeerSearchView.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import SwiftUI
import SDWebImageSwiftUI

struct BeerSearchView: View {
    @StateObject var viewModel: BeerViewModel = BeerViewModel()
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if !isTextFieldFocused {
                Text("Search By Id").font(.title).bold()
            }
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("ID Search...", text: $viewModel.id, onCommit: {
                        viewModel.getSingleBeer()
                    })
                    .focused($isTextFieldFocused)
                    .foregroundColor(.black)
                    
                    if isTextFieldFocused {
                        Image(systemName: "xmark.circle.fill").onTapGesture {
                            viewModel.id = ""
                        }
                    }
                }
                .padding(.all, 8)
                .foregroundColor(.gray)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                
                if isTextFieldFocused {
                    Button(action: {
                        viewModel.id = ""
                    }) {
                        Text("Cancel")
                    }
                }
            }
            
            VStack {
                WebImage(url: URL(string: viewModel.beerResponse.first?.image_url ?? ""))
                    .resizable()
                    .frame(width: 150, height: 300)
                    .padding()
                Text("\(viewModel.beerResponse.first?.id ?? 0)").font(.caption).foregroundColor(.yellow)
                Text(viewModel.beerResponse.first?.name ?? "").font(.title)
                Text(viewModel.beerResponse.first?.description ?? "").foregroundColor(.gray)
                Spacer()
            }
        }.padding()
    }
}
