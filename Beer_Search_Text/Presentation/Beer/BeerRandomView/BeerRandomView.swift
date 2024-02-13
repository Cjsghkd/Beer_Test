//
//  BeerRandomView.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import SwiftUI
import SDWebImageSwiftUI
import BottomSheetSwiftUI

struct BeerRandomView: View {
    @StateObject var viewModel: BeerViewModel = BeerViewModel()
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    
    var body: some View {
        Button(action: {
            viewModel.getRandomBeer()
            bottomSheetPosition = .relative(0.9)
        }, label: {
            Text("Reset")
        })
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(20)
        .bottomSheet(
            bottomSheetPosition: $bottomSheetPosition,
            switchablePositions: [.relativeBottom(0.125), .relativeTop(0.975)]) {
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
                .padding()
            }
            .onDismiss {
                bottomSheetPosition = .hidden
            }
    }
}

struct BeerRandomView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRandomView()
    }
}
