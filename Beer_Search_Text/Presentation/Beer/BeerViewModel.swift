//
//  BeerViewModel.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import Foundation
import Moya

class BeerViewModel: ObservableObject {
    @Published var beerResponse: [Beer] = []
    @Published var id: String = ""
    let beerProvider = MoyaProvider<BeerService>()
    
    func getBeers() {
        beerProvider.request(.getBeers) { result in
            DispatchQueue.global().async {
                switch result {
                case let .success(result):
                    let response = result.data
                    //print(String(data: response, encoding: .utf8))
                    let decoder = JSONDecoder()
                    DispatchQueue.main.async {
                        do {
                            self.beerResponse = try decoder.decode([Beer].self, from: response)
                        } catch(let err) {
                            print(String(describing: err))
                        }
                    }
                case .failure(let err):
                    print(String(describing: err))
                }
            }
        }
    }
    
    func getSingleBeer() {
        beerProvider.request(.getSingleBeer(id: id)) { result in
            DispatchQueue.global().async {
                switch result {
                case let .success(result):
                    let response = result.data
                    print(String(data: response, encoding: .utf8))
                    let decoder = JSONDecoder()
                    DispatchQueue.main.async {
                        do {
                            self.beerResponse = try decoder.decode([Beer].self, from: response)
                        } catch(let err) {
                            print(String(describing: err))
                        }
                    }
                case .failure(let err):
                    print(String(describing: err))
                }
            }
        }
    }
    
    func getRandomBeer() {
        beerProvider.request(.getRandomBeer) { result in
            DispatchQueue.global().async {
                switch result {
                case let .success(result):
                    let response = result.data
                    print(String(data: response, encoding: .utf8))
                    let decoder = JSONDecoder()
                    DispatchQueue.main.async {
                        do {
                            self.beerResponse = try decoder.decode([Beer].self, from: response)
                        } catch(let err) {
                            print(String(describing: err))
                        }
                    }
                case .failure(let err):
                    print(String(describing: err))
                }
            }
        }
    }
    
}
