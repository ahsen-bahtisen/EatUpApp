//
//  HomePagePresenter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 26.10.2022.
//

import Foundation

class HomePagePresenter : ViewToPresenterHomePageProtocol {
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    var homePageView: PresenterToViewHomePageProtocol?
    
    func getFoods() {
        homePageInteractor?.getAllFoods()
    }
    
    func fetchFoodsAtCart() {
        homePageInteractor?.fetchFoodsAtCart()
    }
}
extension HomePagePresenter : InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(foods: Array<Foods>) {
            homePageView?.sendDataToView(foods: foods)
        }
        
    func sendDataToPresenter(foodsAtCart: Int) {
            homePageView?.sendDataToView(foodsAtCart: foodsAtCart)
        }
}
