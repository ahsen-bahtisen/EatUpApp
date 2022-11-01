//
//  CartRouter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol {
    static func createModule(ref: Cart) {
        let presenter = CartPresenter()
        ref.cartPresenterObject = presenter
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        ref.cartPresenterObject?.cartView = ref
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
    }
}
