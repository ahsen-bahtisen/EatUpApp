//
//  CartProtocols.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    
    var cartInteractor : PresenterToInteractorCartProtocol? {get set}
    var cartView : PresenterToViewCartProtocol? {get set}
    
    func getAllCart()
    func deleteSingleItem(cart: FoodsDetail, kullanici_adi: String)
    
    func deleteAlltems(carts : Array<FoodsDetail>)
    func getCount()
    
    func updateCart(cart: FoodsDetail , count: Int)

}
protocol PresenterToInteractorCartProtocol {
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func getCart()
    func deleteSingle(cart: FoodsDetail, kullanici_adi: String)
    
    func deleteAlltems(carts : Array<FoodsDetail>)
    func getCount()

    func updateCart(cart: FoodsDetail , count: Int)
    
}

protocol InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList : Array<FoodsDetail>)
    func sendDataToPresenter(foodCount : Int)
}

protocol PresenterToViewCartProtocol {
    func sendDataToView(cartList : Array<FoodsDetail>)
    func sendDataToView(foodCount : Int)
}

protocol PresenterToRouterCartProtocol{
    static func createModule(ref: Cart)
}

