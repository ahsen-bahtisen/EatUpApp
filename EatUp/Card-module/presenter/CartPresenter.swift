//
//  CartPresenter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class CartPresenter : ViewToPresenterCartProtocol {

    
    var cartInteractor: PresenterToInteractorCartProtocol?
    var cartView: PresenterToViewCartProtocol?
    
    func getAllCart() {
        cartInteractor?.getCart()
    }
    func deleteSingleItem(cart: FoodsDetail, kullanici_adi: String) {
        cartInteractor?.deleteSingle(cart: cart, kullanici_adi: kullanici_adi)
    }
    func deleteAlltems(carts: Array<FoodsDetail>) {
        cartInteractor?.deleteAlltems(carts: carts)
    }
    func getCount() {
        cartInteractor?.getCount()
    }
    func updateCart(cart: FoodsDetail, count: Int) {
        cartInteractor?.updateCart(cart: cart, count: count)
    }
}
extension CartPresenter : InteractorToPresenterCartProtocol {
    func sendDataToPresenter(foodCount: Int) {
        cartView?.sendDataToView(foodCount: foodCount)
    }
    func sendDataToPresenter(cartList: Array<FoodsDetail>) {
        cartView?.sendDataToView(cartList: cartList)
    }
}
