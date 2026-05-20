//
//  CartService.swift
//  LoginWithCombine
//
//  Created by Abdul Aleem on 20/05/26.
//

import Foundation
import Combine

class CartService {
    @Published var cartResponse: CartResponse? = nil
    @Published var cartError: Error? = nil
    
    private var cartSubscription: AnyCancellable?
    
    func getCartList(skip: Int = 0, limit: Int) {
        guard let url = URL(string: "\(AppsNetworkManagerConstants.Endpoints.cart)") else { return }
        cartSubscription = NetworkingManager.getMethod(url: url)
            .decode(type: CartResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.cartSubscription = nil
                case .failure(let error):
                    self?.cartError = error
                    print("Cart list failed: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                self?.cartResponse = response
                print("Cart list: \(response.carts?.flatMap { $0.products ?? [] } ?? [])")
            })
    }
}
